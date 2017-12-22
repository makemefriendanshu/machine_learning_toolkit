defmodule NN do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # children = [
    #   supervisor(Registry, [:unique, Test.Registry]),
    #   supervisor(Test.Account.Supervisor, []),
    #   worker(Test.Account.Starter, [], restart: :transient)
    # ]
    #
    # opts = [strategy: :one_for_one, name: Test.Supervisor]
    # Supervisor.start_link(children, opts)
    NN.Supervisor.start_link
  end
end
