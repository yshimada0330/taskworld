require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Tasklist do
  let(:client) { Taskworld::Client.new }
  let(:space_id) { '59eecc4bb0a6a6bc83f5fc39' }
  let(:project_id) { '59eecc5eb0a6a6bc832ea68f' }

  describe '#tasklist_create', :authenticate_user do
    let(:title) { 'New tasklist' }
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'tasklist' => {
            'list_id' => '59eecc80b0a6a6bc833a7953',
            'owner_id' => '59eecc68b0a6a6bc832ac1fb',
            'space_id' => space_id,
            'project_id' => project_id,
            'title' => title,
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
        }
      end

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/tasklist.create')
               .with(body: { access_token: access_token, project_id: project_id, space_id: space_id, title: title })
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it { expect(client.tasklist_create(space_id: space_id, project_id: project_id, title: title)).to eq response }
    end
  end

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

  describe '#tasklist_move_task', :authenticate_user do
    let(:project_id) { '59eecc5eb0a6a6bc832ea68f' }
    let(:from_list_id) { '59eecc80b0a6a6bc833a7953' }
    let(:to_list_id) { '59eecc84b0a6a6bc832ccb8f' }
    let(:task_id) { '59eecc75b0a6a6bc83217ba1' }

    context 'Success' do
      let(:response) { { 'ok' => true } }

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/tasklist.move-task')
               .with(
                 body: { access_token: access_token,
                         from_list_id: from_list_id,
                         project_id: project_id,
                         space_id: space_id,
                         task_id: task_id,
                         to_list_id: to_list_id }
               ).to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it do
        expect(client.tasklist_move_task(space_id: space_id,
                                         project_id: project_id,
                                         from_list_id: from_list_id,
                                         to_list_id: to_list_id,
                                         task_id: task_id)).to eq response
      end
    end
  end

  describe '#tasklist_update', :authenticate_user do
    let(:title) { 'Updated tasklist' }
    let(:list_id) { '59eecc80b0a6a6bc833a7953' }
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'tasklist' => {
            'list_id' => list_id,
            'owner_id' => '59eecc68b0a6a6bc832ac1fb',
            'space_id' => space_id,
            'project_id' => project_id,
            'title' => title,
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
        }
      end

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/tasklist.update')
               .with(body: { access_token: access_token, list_id: list_id, space_id: space_id, title: title })
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it { expect(client.tasklist_update(space_id: space_id, list_id: list_id, title: title)).to eq response }
    end
  end

  describe '#tasklist_delete', :authenticate_user do
    let(:space_id) { '59eecc5eb0a6a6bc832ea68f' }
    let(:list_id) { '59eecc80b0a6a6bc833a7953' }

    context 'Success' do
      let(:response) { { 'ok' => true } }

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/tasklist.delete')
               .with(body: { access_token: access_token, list_id: list_id, space_id: space_id })
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it { expect(client.tasklist_delete(space_id: space_id, list_id: list_id)).to eq response }
    end
  end
end
