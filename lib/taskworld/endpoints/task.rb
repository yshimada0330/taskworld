module Taskworld
  module Endpoints
    module Task
      def task_get(options = {})
        call_required_field_api(%i(space_id task_id), options) { post('task.get', options) }
      end
    end
  end
end
