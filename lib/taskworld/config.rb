module Taskworld
  module Config
    extend self

    DEFAULT_ENDPONT = 'api.taskworld.com'.freeze
    ENDPOINTS = {
      asia: 'asia-api.taskworld.com',
      europe: 'europe-api.taskworld.com',
      usa: DEFAULT_ENDPONT
    }.freeze

    attr_accessor :server, :email, :password

    def reset
      self.server = nil
      self.email = nil
      self.password = nil
    end

    reset
  end
end
