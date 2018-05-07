module Taskworld
  module Endpoints
    module Project
      def project_get_all(space_id:, **options)
        post('project.get-all', options.tap{ |o| o.store(:space_id, space_id) })
        # call_required_field_api(%i(space_id), options) { post('project.get-all', options) }
      end
    end
  end
end
