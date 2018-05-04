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
end
