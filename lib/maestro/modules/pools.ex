defmodule Maestro.Modules.Pools do
  @moduledoc """
  Maestro Pools Module
  """
  alias Maestro.InputRequest
  alias Maestro.Request
  @type pool_id :: String.t()

  @doc """
  Get pools
  """
  @spec list(InputRequest.t()) :: {:ok, any} | {:error, any}
  def list(%InputRequest{} = r) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get pool blocks
  """
  @spec blocks(InputRequest.t(), pool_id) :: {:ok, any} | {:error, any}
  def blocks(%InputRequest{} = r, pool_id) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("#{pool_id}/blocks")
    |> Request.with_params(r.query_params)
    |> Request.send()
  end

  @doc """
  Get pool delegators
  """
  @spec delegators(InputRequest.t(), pool_id) :: {:ok, any} | {:error, any}
  def delegators(%InputRequest{} = r, pool_id) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("pools/#{pool_id}/delegators")
    |> Request.send()
  end

  @doc """
  Get pool history
  """
  @spec history(InputRequest.t(), pool_id) :: {:ok, any} | {:error, any}
  def history(%InputRequest{} = r, pool_id) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("pools/#{pool_id}/history")
    |> Request.with_params(r.query_params)
    |> Request.send()
  end

  @doc """
  Get pool info
  """
  @spec info(InputRequest.t(), pool_id) :: {:ok, any} | {:error, any}
  def info(%InputRequest{} = r, pool_id) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("pools/#{pool_id}/info")
    |> Request.send()
  end

  @doc """
  Get pool metadata
  """
  @spec metadata(InputRequest.t(), pool_id) :: {:ok, any} | {:error, any}
  def metadata(%InputRequest{} = r, pool_id) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("pools/#{pool_id}/metadata")
    |> Request.send()
  end

  @doc """
  Get pool relays
  """
  @spec relays(InputRequest.t(), pool_id) :: {:ok, any} | {:error, any}
  def relays(%InputRequest{} = r, pool_id) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("pools/#{pool_id}/relays")
    |> Request.send()
  end

  @doc """
  Get pool updates
  """
  @spec updates(InputRequest.t(), pool_id) :: {:ok, any} | {:error, any}
  def updates(%InputRequest{} = r, pool_id) do
    Request.new("pools")
    |> Request.with_method(:get)
    |> Request.set_headers(r.api_key)
    |> Request.with_path("pools/#{pool_id}/updates")
    |> Request.send()
  end
end
