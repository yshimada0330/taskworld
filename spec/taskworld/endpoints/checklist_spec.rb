require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Checklist do
  let(:client) { Taskworld::Client.new }
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

  describe '#checklist_add_item', :authenticate_user do
    context 'Success' do
      let(:title) { 'Read flash boys' }
      let(:response) { { 'ok' => true } }
      let(:url) { 'https://api.taskworld.com/v1/checklist.add-item' }
      let(:body) do
        { access_token: access_token,
          task_id: task_id,
          title: title }
      end

      include_context 'api mock'

      it_behaves_like 'success api response' do
        subject { client.checklist_add_item(task_id: task_id, title: title) }
      end
    end
  end

  describe '#task_delete_item', :authenticate_user do
    context 'Success' do
      let(:checklist_item_id) { '59eecc84b0a6a6bc832ccb8f' }
      let(:response) { { 'ok' => true } }
      let(:url) { 'https://api.taskworld.com/v1/checklist.delete-item' }
      let(:body) do
        { access_token: access_token,
          task_id: task_id,
          checklist_item_id: checklist_item_id }
      end

      include_context 'api mock'

      it_behaves_like 'success api response' do
        subject { client.checklist_delete_item(task_id: task_id, checklist_item_id: checklist_item_id) }
      end
    end
  end

  describe '#checklist_update_item', :authenticate_user do
    context 'Success' do
      let(:checklist_item_id) { '59eecc84b0a6a6bc832ccb8f' }
      let(:response) { { 'ok' => true } }
      let(:url) { 'https://api.taskworld.com/v1/checklist.update-item' }
      let(:body) do
        { access_token: access_token,
          task_id: task_id,
          checklist_item_id: checklist_item_id }
      end

      include_context 'api mock'

      it_behaves_like 'success api response' do
        subject { client.checklist_update_item(task_id: task_id, checklist_item_id: checklist_item_id) }
      end
    end
  end
end
