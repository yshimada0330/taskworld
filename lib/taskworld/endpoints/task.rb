module Taskworld
  module Endpoints
    module Task
      def task_create(space_id:, project_id:, list_id:, title:, **options)
        post('task.create',
              options.merge(space_id: space_id,
                            project_id: project_id,
                            list_id: list_id,
                            title: title))
      end

      def task_get(space_id:, task_id:, **options)
        post('task.get', options.merge(space_id: space_id, task_id: task_id))
      end

      def task_update(space_id:, task_id:, **options)
        post('task.update', options.merge(space_id: space_id, task_id: task_id))
      end

      def task_delete(space_id:, task_id:, **options)
        post('task.delete', options.merge(space_id: space_id, task_id: task_id))
      end
    end
  end
end
