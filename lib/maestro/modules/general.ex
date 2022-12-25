defmodule Maestro.Modules.General do
  @moduledoc """
  Maestro General Module
  """
  alias Maestro.InputRequest
  alias Maestro.Request

  @doc """
  Get chain tip
  """
  @spec chain_tip(InputRequest.t()) :: {:error, any} | {:ok, any}
  def chain_tip(%InputRequest{} = r) do
    Request.new()
    |> Request.with_method("get")
    |> Request.with_path("chain-tip")
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get current slot
  """
  @spec current_slot(InputRequest.t()) :: {:error, any} | {:ok, any}
  def current_slot(%InputRequest{} = r) do
    Request.new()
    |> Request.with_method("get")
    |> Request.with_path("current-slot")
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get era history
  """
  @spec era_history(InputRequest.t()) :: {:error, any} | {:ok, any}
  def era_history(%InputRequest{} = r) do
    Request.new()
    |> Request.with_method("get")
    |> Request.with_path("era-history")
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get protocol params
  """
  @spec protocol_params(InputRequest.t()) :: {:error, any} | {:ok, any}
  def protocol_params(%InputRequest{} = r) do
    Request.new()
    |> Request.with_method("get")
    |> Request.with_path("protocol-params")
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get stake pool
  """
  @spec stake_pools(InputRequest.t()) :: {:error, any} | {:ok, any}
  def stake_pools(%InputRequest{} = r) do
    Request.new()
    |> Request.with_method("get")
    |> Request.with_path("stake-pools")
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end

  @doc """
  Get system pool
  """
  @spec system_start(InputRequest.t()) :: {:error, any} | {:ok, any}
  def system_start(%InputRequest{} = r) do
    Request.new()
    |> Request.with_method("get")
    |> Request.with_path("system-start")
    |> Request.set_headers(r.api_key)
    |> Request.send()
  end
end
