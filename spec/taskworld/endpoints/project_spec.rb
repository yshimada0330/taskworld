require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Project do
  let(:client) { Taskworld::Client.new }

  describe '#project_get_all', :authenticate_user do
    context 'ArgumentError' do
      it 'requires space_id' do
        expect { client.project_get_all }.to raise_error ArgumentError, /Required arguments :space_id missing/
      end
    end
  end
end
