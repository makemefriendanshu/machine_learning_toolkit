defmodule NN do
  use Application

  def start(_type, _args) do
    NN.Supervisor.start_link
  end
end
