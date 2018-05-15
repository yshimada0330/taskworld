require_relative 'endpoints/project'
require_relative 'endpoints/tasklist'
require_relative 'endpoints/task'
require_relative 'endpoints/checklist'

module Taskworld
  module Endpoints
    include Project
    include Tasklist
    include Task
    include Checklist
  end
end
