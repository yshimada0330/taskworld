module Taskworld
  module Endpoints
    module Channel
      def channel_create(space_id:, title:, **options)
        post('channel.create', options.merge(space_id: space_id, title: title))
      end

      def channel_get_all(space_id:, **options)
        post('channel.get-all', options.merge(space_id: space_id))
      end

      def channel_update(space_id:, channel_id:, title:, **options)
        post('channel.update', options.merge(space_id: space_id, channel_id: channel_id, title: title))
      end

      def channel_delete(space_id:, channel_id:, **options)
        post('channel.delete', options.merge(space_id: space_id, channel_id: channel_id))
      end
    end
  end
end
