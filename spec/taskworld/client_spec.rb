require 'spec_helper'
require 'webmock/rspec'

RSpec.describe Taskworld::Client do
  before do
    WebMock.enable!
  end

  after do
    Taskworld::Client.config.reset
  end

  context 'with defaults' do
    let(:client) { Taskworld::Client.new }
    let(:access_token) { '59eecc96åb0a6a6bc83112d65' }

    before do
      WebMock.stub_request(:post, 'https://api.taskworld.com/v1/auth').to_return(
        body: '{"ok": "true", "access_token": "' + access_token + '", "default_space_id": "59eecc50b0a6a6bc831e00cf"}',
        status: 200,
        headers: { 'Content-Type' =>  'application/json' })
    end

    describe '#initialize' do
      it 'sets endpoint' do
        expect(client.endpoint).to eq Taskworld::Config::DEFAULT_ENDPONT
        expect(client.access_token).to eq access_token
      end
    end
  end
end
