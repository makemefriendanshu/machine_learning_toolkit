defmodule NN.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  @input_layer_manager NN.InputLayerManager.Genserver
  @hidden_layer_supervisior NN.HiddenLayerManager.Supervisor
  @output_layer_manager NN.OutputLayerManager.Genserver

  def init(:ok) do
    children = [
      worker(NN.InputLayerManager.Genserver, [], restart: :transient),
      supervisor(NN.HiddenLayerManager.Supervisor, [[size: @no_of_hidden_layes]]),
      worker(NN.OutputLayerManager.Genserver, [], restart: :transient)
    ]

    supervise(children, strategy: :one_for_one)
  end
