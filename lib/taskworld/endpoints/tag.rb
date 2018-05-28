module Taskworld
  module Endpoints
    module Tag
      def tag_create(space_id:, name:, color:, **options)
        post('tag.create', options.merge(space_id: space_id, name: name, color: color))
      end

      def tag_update(space_id:, tag_id:, name:, color:, **options)
        post('tag.update', options.merge(space_id: space_id, tag_id: tag_id, name: name, color: color))
      end

      def tag_get_all(space_id:, **options)
        post('tag.get-all', options.merge(space_id: space_id))
      end
    end
  end
end
