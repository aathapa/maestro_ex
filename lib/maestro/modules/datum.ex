defmodule Maestro.Modules.Datum do
  @moduledoc """
  Maestro Datum Module
  """
  alias Maestro.InputRequest
  alias Maestro.Request

  @type datum_hash :: String.t()

  @spec get(InputRequest.t(), datum_hash) :: {:ok, any} | {:error, any}
  def get(%InputRequest{} = r, datum_hash) do
    Request.new("datum")
    |> Request.with_method(:get)
    |> Request.with_path(datum_hash)
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end
end
