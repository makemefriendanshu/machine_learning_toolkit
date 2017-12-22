defmodule NN.InputLayer.Manager do
  use GenServer
 # does 2 things
 # 1. gets <ids> all the neurons created
 # 2. so that it can pass to previous layer
 # 3. also finds neurons of next layer
 # 4. passes to to all the neurons[during setup]
   
  def start_link do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    send(self(), :start_children)
    {:ok, nil}
  end

  def handle_info(:start_children, _) do
    accounts = [:a, :b, :c]
    Enum.each(accounts, fn account ->
      Test.Account.Supervisor.start_child(account)
    end)
    {:stop, "iz kil"}
  end
end
