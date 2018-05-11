require 'webmock/rspec'

shared_context 'Authenticate a user', :authenticate_user do
  before do
    WebMock.enable!
    WebMock.stub_request(:post, 'https://api.taskworld.com/v1/auth').to_return(
      body: '{"ok": "true", "access_token": "' + access_token + '", "default_space_id": "59eecc50b0a6a6bc831e00cf"}',
      status: 200,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
  after { Taskworld::Client.config.reset }

  let(:access_token) { '59eecc96åb0a6a6bc83112d65' }
end
