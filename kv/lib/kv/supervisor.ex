defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    # children = [
    #   KV.Registry
    # ]
    # children = [
    #   {KV.Registry, name: KV.Registry}
    # ]
    #
    # BEFORE THE RIGHT ORDER AND STRATEGY:
    # children = [
    #   {KV.Registry, name: KV.Registry},
    #   {DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one}
    # ]
        children = [
      {DynamicSupervisor, name: KV.BucketSupervisor, strategy: :one_for_one},
      {KV.Registry, name: KV.Registry}
    ]


    Supervisor.init(children, strategy: :one_for_all)
  end
end
