require 'spec_helper'

RSpec.describe Taskworld::Client do
  context 'with defaults', :authenticate_user do
    let(:client) { Taskworld::Client.new }

    describe '#initialize' do
      it 'sets endpoint' do
        expect(client.endpoint).to eq Taskworld::Config::DEFAULT_ENDPONT
        expect(client.access_token).to eq access_token
      end
    end
  end
end
