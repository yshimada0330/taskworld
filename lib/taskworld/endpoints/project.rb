module Taskworld
  module Endpoints
    module Project
      def project_get_all(space_id:, **options)
        post('project.get-all', options.tap { |o| o.store(:space_id, space_id) })
      end
    end
  end
end
