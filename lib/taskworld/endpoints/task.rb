module Taskworld
  module Endpoints
    module Task
      def task_get(space_id:, task_id:, **options)
        post('task.get', options.merge(space_id: space_id, task_id: task_id))
      end
    end
  end
end
