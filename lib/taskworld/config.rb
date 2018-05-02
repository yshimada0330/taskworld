module Taskworld
  module Config
    extend self

    attr_accessor :server, :email, :password

    def reset
      self.server = nil
      self.email = nil
      self.password = nil
    end

    reset
  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end
