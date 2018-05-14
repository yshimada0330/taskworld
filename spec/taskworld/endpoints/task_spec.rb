require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Task do
  let(:client) { Taskworld::Client.new }
  let(:space_id) { '59eecc4bb0a6a6bc83f5fc39' }
  let(:task_id) { '59e874c153f3fb1dbbb51594' }

  shared_context 'api mock' do
    before do
      WebMock.enable!
      WebMock.stub_request(:post, url)
             .with(body: body)
             .to_return(
               body: JSON.generate(response),
               status: 200,
               headers: { 'Content-Type' => 'application/json' }
             )
    end
  end

  shared_examples 'success api response' do
    it { expect(subject).to eq response }
  end

  describe '#task_create', :authenticate_user do
    let(:project_id) { '59eecc5eb0a6a6bc832ea68f' }
    let(:list_id) { '59eecc55b0a6a6bc83da2771' }
    let(:title) { 'Due diligence' }
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'task' => {
            'task_id' => '59e874c153f3fb1dbbb51594',
            'owner_id' => '59eecc68b0a6a6bc832ac1fb',
            'space_id' => '59eecc55b0a6a6bc83da2771',
            'title' => 'Due diligence',
            'description' => 'This is a description for task',
            'members' => [
              {
                'user_id' => '59e47174fd3f50b21074ec61',
                'is_assignee' => false
              }
            ],
            'checklist' => %w[
              59ef15e98bdce06ecbad90b9
              59ef15ec8bdce06ecbad90bb
              59ef15ee8bdce06ecbad90bd
            ],
            'tags' => %w[
              59e471b2fd3f50b21074ec6e
              59e471b2fd3f50b21074ec6b
              59e471b2fd3f50b21074ec68
            ],
            'comments_count' => 5,
            'color' => 1,
            'points' => 2,
            'status' => 0,
            'start_date' => '2017-10-23T23 =>00 =>00.000Z',
            'due_date' => '2017-10-24T23 =>00 =>00.000Z',
            'completed_date' => '2017-10-24T23 =>00 =>00.000Z',
            'created' => '2017-09-01T23 =>00 =>00.000Z',
            'updated' => '2017-10-01T23 =>00 =>00.000Z',
            'is_deleted' => false
          }
        }
      end
      let(:url) { 'https://api.taskworld.com/v1/task.create' }
      let(:body) do
        { access_token: access_token,
          project_id: project_id,
          space_id: space_id,
          list_id: list_id,
          title: title }
      end

      include_context 'api mock'

      it_behaves_like 'success api response' do
        let(:params) do
          { space_id: space_id,
            project_id: project_id,
            list_id: list_id,
            title: title }
        end
        subject { client.task_create(params) }
      end
    end
  end

  describe '#task_get', :authenticate_user do
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'task' => {
            'task_id' => '59e874c153f3fb1dbbb51594',
            'owner_id' => '59eecc68b0a6a6bc832ac1fb',
            'space_id' => '59eecc55b0a6a6bc83da2771',
            'title' => 'Due diligence',
            'description' => 'This is a description for task',
            'members' => [
              {
                'user_id' => '59e47174fd3f50b21074ec61',
                'is_assignee' => false
              }
            ],
            'checklist' => %w[
              59ef15e98bdce06ecbad90b9
              59ef15ec8bdce06ecbad90bb
              59ef15ee8bdce06ecbad90bd
            ],
            'tags' => %w[
              59e471b2fd3f50b21074ec6e
              59e471b2fd3f50b21074ec6b
              59e471b2fd3f50b21074ec68
            ],
            'comments_count' => 5,
            'color' => 1,
            'points' => 2,
            'status' => 0,
            'start_date' => '2017-10-23T23 =>00 =>00.000Z',
            'due_date' => '2017-10-24T23 =>00 =>00.000Z',
            'completed_date' => '2017-10-24T23 =>00 =>00.000Z',
            'created' => '2017-09-01T23 =>00 =>00.000Z',
            'updated' => '2017-10-01T23 =>00 =>00.000Z',
            'is_deleted' => false
          }
        }
      end
      let(:url) { 'https://api.taskworld.com/v1/task.get' }
      let(:body) do
        { access_token: access_token,
          space_id: space_id,
          task_id: task_id }
      end

      include_context 'api mock'

      it_behaves_like 'success api response' do
        subject { client.task_get(space_id: space_id, task_id: task_id) }
      end
    end
  end

  describe '#task_update', :authenticate_user do
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'task' => {
            'task_id' => '59e874c153f3fb1dbbb51594',
            'owner_id' => '59eecc68b0a6a6bc832ac1fb',
            'space_id' => '59eecc55b0a6a6bc83da2771',
            'title' => 'Due diligence',
            'description' => 'This is a description for task',
            'members' => [
              {
                'user_id' => '59e47174fd3f50b21074ec61',
                'is_assignee' => false
              }
            ],
            'checklist' => %w[
              59ef15e98bdce06ecbad90b9
              59ef15ec8bdce06ecbad90bb
              59ef15ee8bdce06ecbad90bd
            ],
            'tags' => %w[
              59e471b2fd3f50b21074ec6e
              59e471b2fd3f50b21074ec6b
              59e471b2fd3f50b21074ec68
            ],
            'comments_count' => 5,
            'color' => 1,
            'points' => 2,
            'status' => 0,
            'start_date' => '2017-10-23T23 =>00 =>00.000Z',
            'due_date' => '2017-10-24T23 =>00 =>00.000Z',
            'completed_date' => '2017-10-24T23 =>00 =>00.000Z',
            'created' => '2017-09-01T23 =>00 =>00.000Z',
            'updated' => '2017-10-01T23 =>00 =>00.000Z',
            'is_deleted' => false
          }
        }
      end
      let(:url) { 'https://api.taskworld.com/v1/task.update' }
      let(:body) do
        { access_token: access_token,
          space_id: space_id,
          task_id: task_id }
      end

      include_context 'api mock'

      it_behaves_like 'success api response' do
        subject { client.task_update(space_id: space_id, task_id: task_id) }
      end
    end
  end

  describe '#task_delete', :authenticate_user do
    context 'Success' do
      let(:response) { { 'ok' => true } }
      let(:url) { 'https://api.taskworld.com/v1/task.delete' }
      let(:body) do
        { access_token: access_token,
          space_id: space_id,
          task_id: task_id }
      end

      include_context 'api mock'

      it_behaves_like 'success api response' do
        subject { client.task_delete(space_id: space_id, task_id: task_id) }
      end
    end
  end
end
