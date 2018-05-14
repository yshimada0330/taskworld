module Taskworld
  module Endpoints
    module Checklist
      def checklist_add_item(task_id:, title:, **options)
        post('checklist.add-item', options.merge(task_id: task_id, title: title))
      end

      def checklist_delete_item(task_id:, checklist_item_id:, **options)
        post('checklist.delete-item', options.merge(task_id: task_id, checklist_item_id: checklist_item_id))
      end

      def checklist_update_item(task_id:, checklist_item_id:, **options)
        post('checklist.update-item', options.merge(task_id: task_id, checklist_item_id: checklist_item_id))
      end
    end
  end
end
