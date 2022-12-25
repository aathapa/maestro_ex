defmodule Maestro.Modules.Addresses do
  @moduledoc """
  Maestro Address Module
  """

  alias Maestro.InputRequest
  alias Maestro.Request
  @type address :: String.t()

  @doc """
  Post addresses utxo
  """
  def utxos(%InputRequest{} = r) do
    Request.new("addresses")
    |> Request.with_method(:post)
    |> Request.with_path("utxos")
    |> Request.set_headers(r.api_key)
    |> Request.with_params(r.query_params)
    |> Request.with_body(r.body)
    |> Request.send()
  end

  @doc """
  Get address transactions count
  """
  @spec transaction_count(InputRequest.t(), address) :: {:error, any} | {:ok, any}
  def transaction_count(%InputRequest{} = r, address) do
    path = "#{address}/transactions/count"

    Request.new("addresses")
    |> Request.with_method(:get)
    |> Request.with_path(path)
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get address utxo refs
  """
  @spec utxo_refs(InputRequest.t(), address) :: {:error, any} | {:ok, any}
  def utxo_refs(%InputRequest{} = r, address) do
    Request.new("addresses")
    |> Request.with_method(:get)
    |> Request.with_path("#{address}/utxo_refs")
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get address utxo
  """
  @spec utxo(InputRequest.t(), address) :: {:error, any} | {:ok, any}
  def utxo(%InputRequest{} = r, address) do
    Request.new("addresses")
    |> Request.with_method(:get)
    |> Request.with_path("#{address}/utxos")
    |> Request.set_headers(r.api_key)
    |> Request.with_params(r.query_params)
    |> Request.send()
  end
end
