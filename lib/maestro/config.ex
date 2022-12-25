defmodule Maestro.Config do
  @moduledoc """
  Configuration for Maestro
  """

  defstruct [:api_key, :base_url]

  @type t() :: %__MODULE__{
          api_key: String.t(),
          base_url: String.t()
        }

  @doc """
  Returns configuration for maestro

  ## Example

      iex>get_config()
      %Config{api_key: "maestro api key", base_url: "maestro base url"}
  """

  @spec get_config() :: Config.t()
  def get_config do
    case Application.get_env(:maestro, :maestro) do
      nil ->
        raise ArgumentError, message: "Environment variables for maestro is not defined"

      config ->
        cfg =
          Enum.map(config, fn {k, v} ->
            {k, get_value(v)}
          end)

        struct!(__MODULE__, cfg)
    end
  end

  defp get_value({:system, system_var}), do: System.get_env(system_var)
  defp get_value(value), do: value
end
