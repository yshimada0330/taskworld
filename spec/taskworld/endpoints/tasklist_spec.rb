require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Task do
  let(:client) { Taskworld::Client.new }

  describe '#task_get', :authenticate_user do
    subject{ client.task_get(options)  }
    context 'ArgumentError' do
      context 'empty space_id' do
        let(:options) { {} }
        it 'requires space_id error' do
          expect { subject }.to raise_error ArgumentError, /Required arguments :space_id missing/
        end
      end

      context 'empty task_id' do
        let(:options) { { space_id: 'xxx'} }
        it 'requires task_id error' do
          expect { subject }.to raise_error ArgumentError, /Required arguments :task_id missing/
        end
      end
    end
  end
end
