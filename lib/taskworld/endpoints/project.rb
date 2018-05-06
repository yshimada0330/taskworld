module Taskworld
  module Endpoints
    module Project
      def project_get_all(options = {})
        throw ArgumentError.new('Required arguments :space_id missing') if options[:space_id].nil?
        post('project.get-all', options)
      end
    end
  end
end
