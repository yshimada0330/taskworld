module Taskworld
  class Client
    include Connection
    include Request
    include Endpoints

    attr_accessor :endpoint, :access_token, :default_space_id, :workspaces

    class << self
      def configure
        block_given? ? yield(Config) : Config
      end

      def config
        Config
      end
    end

    def initialize
      @endpoint ||= Config::ENDPOINTS.fetch(Config.server, Config::DEFAULT_ENDPONT)
      auth
    end

    private

    def auth
      response = post('auth', email: Config.email, password: Config.password)
      raise 'fail auth' unless response['ok']
      @access_token = response['access_token']
      @default_space_id = response['default_space_id']
      @workspaces = response['workspaces']
    end

    def call_required_field_api(required_fields, options)
      required_fields.each do |field|
        throw ArgumentError.new("Required arguments :#{field} missing") if options[field].nil?
      end
      yield
    end
  end
end
