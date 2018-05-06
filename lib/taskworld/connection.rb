module Taskworld
  module Connection
    private

    def connection
      options = {
        headers: { Accept: 'application/json; charset=utf-8' }
      }

      # request_options = {}
      # request_options[:timeout] = timeout if timeout
      # request_options[:open_timeout] = open_timeout if open_timeout
      # options[:request] = request_options if request_options.any?

      ::Faraday::Connection.new("https://#{endpoint}/v1/", options) do |connection|
        connection.use ::Faraday::Request::Multipart
        connection.use ::Faraday::Request::UrlEncoded
        connection.use ::Faraday::Response::RaiseError
        connection.use ::FaradayMiddleware::ParseJson
        connection.adapter ::Faraday.default_adapter
      end
    end
  end
end
