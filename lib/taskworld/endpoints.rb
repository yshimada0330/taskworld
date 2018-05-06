require_relative 'endpoints/project'
require_relative 'endpoints/tasklist'
require_relative 'endpoints/task'

module Taskworld
  module Endpoints
    include Project
    include Tasklist
    include Task
  end
end
