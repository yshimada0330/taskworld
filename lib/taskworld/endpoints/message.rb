module Taskworld
  module Endpoints
    module Message
      def message_create(space_id:, parent_id:, parent_type:, body:, **options)
        post('message.create',
             options.merge(space_id: space_id,
                           parent_id: parent_id,
                           parent_type: parent_type,
                           body: body))
      end

      def message_get(space_id:, parent_id:, parent_type:, **options)
        post('message.get', options.merge(space_id: space_id, parent_id: parent_id, parent_type: parent_type))
      end

      def message_update(space_id:, parent_id:, parent_type:, message_id:, body:, **options)
        post('message.update',
             options.merge(space_id: space_id,
                           parent_id: parent_id,
                           parent_type: parent_type,
                           message_id: message_id,
                           body: body))
      end

      def message_delete(space_id:, message_id:, **options)
        post('message.delete', options.merge(space_id: space_id, message_id: message_id))
      end
    end
  end
end
