require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Tasklist do
  let(:client) { Taskworld::Client.new }
  let(:space_id) { '59eecc4bb0a6a6bc83f5fc39' }
  let(:project_id) { '59eecc5eb0a6a6bc832ea68f' }

  describe '#tasklist_get_all', :authenticate_user do
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'tasklists' => [
            {
              'list_id' => '59eecc80b0a6a6bc833a7953',
              'owner_id' => '59eecc68b0a6a6bc832ac1fb',
              'space_id' => space_id,
              'project_id' => project_id,
              'title' => 'New tasklist',
              'is_deleted' => false,
              'tasks' => %w[
                59eecc75b0a6a6bc83217ba1
                59eecc78b0a6a6bc831a5a9f
              ],
              'type' => 0,
              'created' => '2017-09-01T23 =>00 =>00.000Z',
              'updated' => '2017-09-01T23 =>00 =>00.000Z',
              'is_private' => false,
              'is_inbox' => false
            }
          ]
        }
      end

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/tasklist.get-all')
               .with(body: /project_id=#{project_id}&space_id=#{space_id}/)
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      subject { client.tasklist_get_all(space_id: space_id, project_id: project_id) }
      it { expect(subject).to eq response }
    end
  end
end
