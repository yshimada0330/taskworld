module Taskworld
  module Endpoints
    module Tasklist
      def tasklist_get_all(space_id:, project_id: , **options)
        post('tasklist.get-all', options.merge(space_id: space_id, project_id: project_id))
      end
    end
  end
end
