defmodule Sapphire.Mocks.Config do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sapphire.Mocks.Endpoint

  schema "configs" do
    field :body, :string
    field :delay, :integer
    field :is_selected, :boolean, default: false
    field :status_code, :integer
    field :type, :string
    field :url, :string
    belongs_to :endpoint, Endpoint
    timestamps()
  end

  @doc false
  def changeset(config, attrs) do
    config
    |> cast(attrs, [:url, :type, :delay, :is_selected, :body, :status_code])
    |> validate_required([:url, :type, :delay, :is_selected, :body, :status_code])
  end
end
