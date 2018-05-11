require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Task do
  let(:client) { Taskworld::Client.new }
  let(:space_id) { '59eecc4bb0a6a6bc83f5fc39' }
  let(:task_id) { '59e874c153f3fb1dbbb51594' }

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

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/task.get')
               .with(body: /space_id=#{space_id}&task_id=#{task_id}/)
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      subject { client.task_get(space_id: space_id, task_id: task_id) }
      it { expect(subject).to eq response }
    end
  end
end
