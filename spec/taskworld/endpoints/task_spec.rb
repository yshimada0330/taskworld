require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Tasklist do
  let(:client) { Taskworld::Client.new }

  describe '#tasklist_get_all', :authenticate_user do
    subject{ client.tasklist_get_all(options)  }
    context 'ArgumentError' do
      context 'empty space_id' do
        let(:options) { {} }
        it 'requires space_id error' do
          expect { subject }.to raise_error ArgumentError, /Required arguments :space_id missing/
        end
      end

      context 'empty project_id' do
        let(:options) { { space_id: 'xxx'} }
        it 'requires project_id error' do
          expect { subject }.to raise_error ArgumentError, /Required arguments :project_id missing/
        end
      end
    end
  end
end
