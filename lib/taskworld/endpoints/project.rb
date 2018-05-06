module Taskworld
  module Endpoints
    module Project
      def project_get_all(options = {})
        call_required_field_api(%i(space_id), options) { post('project.get-all', options) }
      end
    end
  end
end
