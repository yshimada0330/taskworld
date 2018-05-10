module Taskworld
  module Endpoints
    module Project
      def project_create(space_id:, title:, **options)
        post('project.create', options.merge(space_id: space_id, title: title))
      end

      def project_get_all(space_id:, **options)
        post('project.get-all', options.tap { |o| o.store(:space_id, space_id) })
      end

      def project_update(space_id:, project_id:, **options)
        post('project.update', options.merge(space_id: space_id, project_id: project_id))
      end

      def project_delete(space_id:, project_id:, **options)
        post('project.delete', options.merge(space_id: space_id, project_id: project_id))
      end
    end
  end
end
