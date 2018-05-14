module Taskworld
  module Endpoints
    module Tasklist
      def tasklist_create(space_id:, project_id:, title:, **options)
        post('tasklist.create', options.merge(space_id: space_id, project_id: project_id, title: title))
      end

      def tasklist_get_all(space_id:, project_id:, **options)
        post('tasklist.get-all', options.merge(space_id: space_id, project_id: project_id))
      end

      def tasklist_move_task(space_id:, project_id:, from_list_id:, to_list_id:, task_id:, **options)
        post('tasklist.move-task',
             options.merge(space_id: space_id,
                           project_id: project_id,
                           from_list_id: from_list_id,
                           to_list_id: to_list_id,
                           task_id: task_id))
      end

      def tasklist_update(space_id:, list_id:, title:, **options)
        post('tasklist.update', options.merge(space_id: space_id, list_id: list_id, title: title))
      end

      def tasklist_delete(space_id:, list_id:, **options)
        post('tasklist.delete', options.merge(space_id: space_id, list_id: list_id))
      end
    end
  end
end
