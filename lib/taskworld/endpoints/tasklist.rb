module Taskworld
  module Endpoints
    module Tasklist
      def tasklist_get_all(options = {})
        call_required_field_api(%i(space_id project_id), options) { post('tasklist.get-all', options) }
      end
    end
  end
end
