defmodule ChatWrites.MessageCollector do
  use GenServer

  @default_interval_ms 5000

  @doc """
  Starts the message collector.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc """
  Add a message to the collector.
  """
  def add(message) do
    GenServer.cast(__MODULE__, {:add, message})
  end

  # ----------------------------------------------------------------------------
  # GenServer callbacks
  # ----------------------------------------------------------------------------

  @impl GenServer
  def init(opts) do
    interval_ms = Keyword.get(opts, :interval_ms, @default_interval_ms)

    state = %{
      interval_ms: interval_ms,
      timer_ref: nil,
      messages: []
    }

    {:ok, state, {:continue, :init}}
  end

  @impl GenServer
  def handle_continue(:init, state) do
    timer_ref = schedule_next(state.interval_ms)
    {:noreply, %{state | timer_ref: timer_ref}}
  end

  @impl GenServer
 def handle_cast({:add, message}, state) do
   {:noreply, %{state | messages: [message | state.messages]}}
 end

 @impl GenServer
 def handle_info(:tick, state) do
   result =
     state.messages
     |> Enum.frequencies()
     |> Enum.sort_by(fn {_w, freq} -> freq end)
     |> List.first()

   with {most_common, _} <- result do
     handle_most_common(most_common)
   end

   timer_ref = schedule_next(state.interval_ms)

   {:noreply, %{state | messages: [], timer_ref: timer_ref}}
 end

 # ----------------------------------------------------------------------------
 # Helpers
 # ----------------------------------------------------------------------------

 defp handle_most_common(message) do
   IO.puts(message)
 end

 defp schedule_next(interval_ms) do
   Process.send_after(self(), :tick, interval_ms)
 end
end
