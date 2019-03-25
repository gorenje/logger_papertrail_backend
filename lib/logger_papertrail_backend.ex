defmodule LoggerPapertrailBackend do
  @moduledoc false
  use Application

  def init({__MODULE__, _name}) do
    Application.ensure_all_started :LoggerPapertrailBackend
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      worker(LoggerPapertrailBackend.Sender, [])
    ]
    opts = [strategy: :one_for_one, name: LoggerPapertrailBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
