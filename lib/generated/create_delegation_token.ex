defmodule(Kayrock.CreateDelegationToken) do
  @api :create_delegation_token
  @moduledoc "Kayrock-generated module for the Kafka `#{@api}` API\n"
  _ = " THIS CODE IS GENERATED BY KAYROCK"

  (
    @vmin 0
    @vmax 0
  )

  defmodule(V0.Request) do
    @vsn 0
    @api :create_delegation_token
    @schema renewers: {:array, [principal_type: :string, name: :string]}, max_life_time: :int64
    @moduledoc "Kayrock-generated request struct for Kafka `#{@api}` v#{@vsn} API\nmessages\n\nThe schema of this API is\n```\n#{
                 inspect(@schema, pretty: true)
               }\n```\n"
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(renewers: [], max_life_time: nil, correlation_id: nil, client_id: nil)
    import(Elixir.Kayrock.Serialize)
    @typedoc "Request struct for the Kafka `#{@api}` API v#{@vsn}\n"
    @type t :: %__MODULE__{}
    @doc "Returns the Kafka API key for this API"
    @spec api_key :: integer
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_delegation_token)
    end

    @doc "Returns the API version (#{@vsn}) implemented by this module"
    @spec api_vsn :: integer
    def(api_vsn) do
      0
    end

    @doc "Returns a function that can be used to deserialize the wire response from the\nbroker for this message type\n"
    @spec response_deserializer :: (binary -> {V0.Response.t(), binary})
    def(response_deserializer) do
      &V0.Response.deserialize/1
    end

    @doc "Returns the schema of this message\n\nSee [above](#).\n"
    @spec schema :: term
    def(schema) do
      [renewers: {:array, [principal_type: :string, name: :string]}, max_life_time: :int64]
    end

    @doc "Serialize a message to binary data for transfer to a Kafka broker"
    @spec serialize(t()) :: iodata
    def(serialize(%V0.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          case(Map.fetch!(struct, :renewers)) do
            nil ->
              <<-1::32-signed>>

            [] ->
              <<0::32-signed>>

            vals when is_list(vals) ->
              [
                <<length(vals)::32-signed>>,
                for(v <- vals) do
                  [
                    serialize(:string, Map.fetch!(v, :principal_type)),
                    serialize(:string, Map.fetch!(v, :name))
                  ]
                end
              ]
          end,
          serialize(:int64, Map.fetch!(struct, :max_life_time))
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V0.Request) do
    def(serialize(%V0.Request{} = struct)) do
      try do
        V0.Request.serialize(struct)
      rescue
        e ->
          reraise(Kayrock.InvalidRequestError, {e, struct}, System.stacktrace())
      end
    end

    def(api_vsn(%V0.Request{})) do
      V0.Request.api_vsn()
    end

    def(response_deserializer(%V0.Request{})) do
      V0.Request.response_deserializer()
    end
  end

  (
    @doc "Returns a request struct for this API with the given version"
    @spec get_request_struct(integer) :: request_t
  )

  def(get_request_struct(0)) do
    %V0.Request{}
  end

  defmodule(V0.Response) do
    @vsn 0
    @api :create_delegation_token
    @schema error_code: :int16,
            owner: [principal_type: :string, name: :string],
            issue_timestamp: :int64,
            expiry_timestamp: :int64,
            max_timestamp: :int64,
            token_id: :string,
            hmac: :bytes,
            throttle_time_ms: :int32
    @moduledoc "Kayrock-generated response struct for Kafka `#{@api}` v#{@vsn} API\nmessages\n\nThe schema of this API is\n```\n#{
                 inspect(@schema, pretty: true)
               }\n```\n"
    _ = " THIS CODE IS GENERATED BY KAYROCK"

    defstruct(
      error_code: nil,
      owner: nil,
      issue_timestamp: nil,
      expiry_timestamp: nil,
      max_timestamp: nil,
      token_id: nil,
      hmac: nil,
      throttle_time_ms: nil,
      correlation_id: nil
    )

    @typedoc "Response struct for the Kafka `#{@api}` API v#{@vsn}\n"
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)
    @doc "Returns the Kafka API key for this API"
    @spec api_key :: integer
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_delegation_token)
    end

    @doc "Returns the API version (#{@vsn}) implemented by this module"
    @spec api_vsn :: integer
    def(api_vsn) do
      0
    end

    @doc "Returns the schema of this message\n\nSee [above](#).\n"
    @spec schema :: term
    def(schema) do
      [
        error_code: :int16,
        owner: [principal_type: :string, name: :string],
        issue_timestamp: :int64,
        expiry_timestamp: :int64,
        max_timestamp: :int64,
        token_id: :string,
        hmac: :bytes,
        throttle_time_ms: :int32
      ]
    end

    @doc "Deserialize data for this version of this API\n"
    @spec deserialize(binary) :: {t(), binary}
    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data
      deserialize_field(:root, :error_code, %__MODULE__{correlation_id: correlation_id}, rest)
    end

    defp(deserialize_field(:root, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:root, :owner, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:owner, :principal_type, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:owner, :name, Map.put(acc, :principal_type, val), rest)
    end

    defp(deserialize_field(:owner, :name, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:owner, nil, Map.put(acc, :name, val), rest)
    end

    defp(deserialize_field(:root, :owner, acc, data)) do
      {val, rest} = deserialize_field(:owner, :principal_type, %{}, data)
      deserialize_field(:root, :issue_timestamp, Map.put(acc, :owner, val), rest)
    end

    defp(deserialize_field(:root, :issue_timestamp, acc, data)) do
      {val, rest} = deserialize(:int64, data)
      deserialize_field(:root, :expiry_timestamp, Map.put(acc, :issue_timestamp, val), rest)
    end

    defp(deserialize_field(:root, :expiry_timestamp, acc, data)) do
      {val, rest} = deserialize(:int64, data)
      deserialize_field(:root, :max_timestamp, Map.put(acc, :expiry_timestamp, val), rest)
    end

    defp(deserialize_field(:root, :max_timestamp, acc, data)) do
      {val, rest} = deserialize(:int64, data)
      deserialize_field(:root, :token_id, Map.put(acc, :max_timestamp, val), rest)
    end

    defp(deserialize_field(:root, :token_id, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:root, :hmac, Map.put(acc, :token_id, val), rest)
    end

    defp(deserialize_field(:root, :hmac, acc, data)) do
      {val, rest} = deserialize(:bytes, data)
      deserialize_field(:root, :throttle_time_ms, Map.put(acc, :hmac, val), rest)
    end

    defp(deserialize_field(:root, :throttle_time_ms, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:root, nil, Map.put(acc, :throttle_time_ms, val), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  (
    @doc "Deserializes raw wire data for this API with the given version"
    @spec deserialize(integer, binary) :: {response_t, binary}
  )

  def(deserialize(0, data)) do
    V0.Response.deserialize(data)
  end

  (
    @typedoc "Union type for all request structs for this API"
    @type request_t :: Kayrock.CreateDelegationToken.V0.Request.t()
  )

  (
    @typedoc "Union type for all response structs for this API"
    @type response_t :: Kayrock.CreateDelegationToken.V0.Response.t()
  )

  (
    @doc "Returns the minimum version of this API supported by Kayrock (#{@vmin})"
    @spec min_vsn :: integer
    def(min_vsn) do
      0
    end
  )

  (
    @doc "Returns the maximum version of this API supported by Kayrock (#{@vmax})"
    @spec max_vsn :: integer
    def(max_vsn) do
      0
    end
  )
end
