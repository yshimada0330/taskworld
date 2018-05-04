module Taskworld
  class Client
    include Connection
    include Request
    include Endpoints

    ENDPOINTS = {
      asia: 'asia-api.taskworld.com',
      europe: 'europe-api.taskworld.com',
      usa: 'api.taskworld.com'
    }.freeze

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
      @endpoint ||= ENDPOINTS.fetch(Config.server, 'api.taskworld.com')
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
  end
end
