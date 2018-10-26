defmodule Sapphire.Mocks.Parameter do
  use Ecto.Schema
  import Ecto.Changeset


  schema "parameters" do
    field :name, :string
    field :config_id, :id

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
