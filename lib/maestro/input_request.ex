defmodule Maestro.InputRequest do
  @moduledoc """
  Api input request data structure
  """
  defstruct [:module_api_name, :body, :query_params, :api_key]

  @enforce_keys [:api_key]
  @type t() :: %__MODULE__{
          api_key: String.t(),
          query_params: map(),
          body: map()
        }

  def new(api_key, query_params \\ %{}, body \\ %{}) do
    %__MODULE__{
      api_key: api_key,
      body: body,
      query_params: query_params
    }
  end
end
