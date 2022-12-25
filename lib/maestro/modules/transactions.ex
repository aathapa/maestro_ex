defmodule Maestro.Modules.Transactions do
  @moduledoc """
  Maestro Transaction Module
  """
  alias Maestro.InputRequest
  alias Maestro.Request

  @type tx_hash :: String.t()
  @type index :: integer()

  @doc """
  Submit transaction
  """
  @spec submit(InputRequest.t()) :: {:ok, any} | {:error, any}
  def submit(%InputRequest{} = r) do
    Request.new()
    |> Request.with_method(:post)
    |> Request.set_headers(r.api_key)
    |> Request.with_body(r.body)
    |> Request.send()
  end

  @doc """
  Get transaction cbor
  """
  @spec cbor(InputRequest.t(), tx_hash) :: {:ok, any} | {:error, any}
  def cbor(%InputRequest{} = r, tx_hash) do
    Request.new("transactions")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("transactions/#{tx_hash}/cbor")
    |> Request.with_body(r.body)
    |> Request.send()
  end

  @doc """
  Get transaction address
  """
  @spec output_address(InputRequest.t(), tx_hash, index) :: {:ok, any} | {:error, any}
  def output_address(%InputRequest{} = r, tx_hash, index) do
    Request.new("transactions")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("transactions/#{tx_hash}/outputs/#{index}/address")
    |> Request.with_body(r.body)
    |> Request.send()
  end

  @doc """
  Get transaction utxo
  """
  @spec output_utxo(InputRequest.t(), tx_hash, index) :: {:ok, any} | {:error, any}
  def output_utxo(%InputRequest{} = r, tx_hash, index) do
    Request.new("transactions")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("transactions/#{tx_hash}/outputs/#{index}/utxo")
    |> Request.with_body(r.body)
    |> Request.send()
  end
end
