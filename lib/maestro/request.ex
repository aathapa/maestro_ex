defmodule Maestro.Request do
  @moduledoc """
  handle HTTP request to maestro
  """
  alias Maestro.Config

  @enforce_keys [:module_api_name]
  @default_headers [
    {"Content-Type", "application/json"}
  ]
  defstruct [
    :path,
    :method,
    :module_api_name,
    :base_url,
    params: %{},
    body: %{},
    headers: @default_headers
  ]

  @doc """
  Initialize Request struct

  ## Example
      iex> Request.new(module_api_name \\ "general")
  """
  @spec new(String.t()) :: __MODULE__
  def new(module_api_name \\ "") do
    cfg = Config.get_config()
    %__MODULE__{module_api_name: module_api_name, base_url: cfg.base_url}
  end

  def set_module_api_name(%__MODULE__{} = r, module_api_name) do
    %{r | module_api_name: module_api_name}
  end

  def with_method(%__MODULE__{} = r, method) do
    %{r | method: method}
  end

  def set_base_url(%__MODULE__{} = r, base_url) do
    %{r | base_url: base_url}
  end

  def set_headers(%__MODULE__{} = r, api_key) do
    headers = prepare_default_headers(api_key)
    %{r | headers: headers}
  end

  def with_path(%__MODULE__{} = r, path) do
    %{r | path: path}
  end

  def with_body(%__MODULE__{} = r, body) do
    %{r | body: body}
  end

  def with_params(%__MODULE__{} = r, params) do
    %{r | params: params}
  end

  def send(%__MODULE__{method: :get} = r) do
    url = construct_url(r)

    res = HTTPoison.get(url, r.headers)
    handle_response(res)
  end

  def send(%__MODULE__{} = r) do
    url = construct_url(r)
    body = if is_map(r.body), do: Jason.encode!(r.body), else: r.body

    HTTPoison.request(r.method, url, body, r.headers)
    |> handle_response()
  end

  defp prepare_default_headers(api_key) do
    %{
      "Accept" => "Application/json",
      "X-API-Token" => api_key
    }
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: status_code}})
       when status_code in [200, 201, 202, 203, 204, 205, 206] do
    {:ok, json_or_value(body)}
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body}}) do
    {:error, json_or_value(body)}
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, json_or_value(reason)}
  end

  defp json_or_value(data) when is_binary(data) do
    case Jason.decode(data) do
      {:ok, parsed_value} -> parsed_value
      _ -> data
    end
  end

  defp json_or_value(data), do: data

  defp construct_url(%__MODULE__{module_api_name: module_api_name} = r)
       when module_api_name in ["general", ""] do
    encoded_params = URI.encode_query(r.params)
    "#{r.base_url}/#{r.path}?#{encoded_params}"
  end

  defp construct_url(%__MODULE__{params: params, path: path} = r) when not is_nil(path) do
    encoded_params = URI.encode_query(params)
    "#{r.base_url}/#{r.module_api_name}/#{path}?#{encoded_params}"
  end

  defp construct_url(%__MODULE__{} = r) do
    encoded_params = URI.encode_query(r.params)
    "#{r.base_url}/#{r.module_api_name}?#{encoded_params}"
  end
end
