defmodule NN.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__,nil, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(NN.InputLayerManager.Genserver, [], restart: :transient),
      supervisor(NN.HiddenLayerManager.Supervisor, [[name: @type_of_network]]),
      worker(NN.OutputLayerManager.Genserver, [], restart: :transient)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
