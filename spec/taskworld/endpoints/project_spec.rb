require 'spec_helper'

RSpec.describe Taskworld::Endpoints::Project do
  let(:client) { Taskworld::Client.new }
  let(:space_id) { '59eecc4bb0a6a6bc83f5fc39' }

  describe '#project_create', :authenticate_user do
    let(:title) { 'Due diligence' }
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'space_id' => space_id,
          'project_id' => '59eecc5eb0a6a6bc832ea68f',
          'owner_id' => '59eecc68b0a6a6bc832ac1fb',
          'title' => title,
          'description' => 'a private project of Goldman Goose',
          'members' => %w[
            59eecc68b0a6a6bc832ac1fb
            59eecc6bb0a6a6bc8318c107
          ],
          'is_private' => true,
          'created' => '2017-09-01T23 =>00 =>00.000Z',
          'updated' => '2017-10-01T23 =>00 =>00.000Z'
        }
      end

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/project.create')
               .with(body: { access_token: access_token, space_id: space_id, title: title })
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it { expect(client.project_create(space_id: space_id, title: title)).to eq response }
    end
  end

  describe '#project_get_all', :authenticate_user do
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'projects' => [
            {
              'space_id' => '59eecc5eb0a6a6bc832ea68f',
              'project_id' => space_id,
              'owner_id' => '59eecc68b0a6a6bc832ac1fb',
              'title' => 'Due diligence',
              'description' => 'a private project of Goldman Goose',
              'members' => %w[
                59eecc68b0a6a6bc832ac1fb
                59eecc6bb0a6a6bc8318c107
              ],
              'is_private' => true,
              'created' => '2017-09-01T23=>00=>00.000Z',
              'updated' => '2017-10-01T23=>00=>00.000Z'
            }
          ]
        }
      end

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/project.get-all')
               .with(body: /space_id=#{space_id}/)
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it { expect(client.project_get_all(space_id: space_id)).to eq response }
    end
  end

  describe '#project_update', :authenticate_user do
    let(:project_id) { '59eecc5eb0a6a6bc832ea68f' }
    let(:title) { 'Due diligence' }
    context 'Success' do
      let(:response) do
        {
          'ok' => true,
          'space_id' => space_id,
          'project_id' => project_id,
          'owner_id' => '59eecc68b0a6a6bc832ac1fb',
          'title' => title,
          'description' => 'a private project of Goldman Goose',
          'members' => %w[
            59eecc68b0a6a6bc832ac1fb
            59eecc6bb0a6a6bc8318c107
          ],
          'is_private' => true,
          'created' => '2017-09-01T23 =>00 =>00.000Z',
          'updated' => '2017-10-01T23 =>00 =>00.000Z'
        }
      end

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/project.update')
               .with(body: { access_token: access_token, project_id: project_id, space_id: space_id })
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it { expect(client.project_update(space_id: space_id, project_id: project_id)).to eq response }
    end
  end

  describe '#project_delete', :authenticate_user do
    let(:project_id) { '59eecc5eb0a6a6bc832ea68f' }

    context 'Success' do
      let(:response) { { 'ok' => true } }

      before do
        WebMock.enable!
        WebMock.stub_request(:post, 'https://api.taskworld.com/v1/project.delete')
               .with(body: /space_id=#{space_id}/)
               .to_return(
                 body: JSON.generate(response),
                 status: 200,
                 headers: { 'Content-Type' => 'application/json' }
               )
      end

      it { expect(client.project_delete(space_id: space_id, project_id: project_id)).to eq response }
    end
  end
end
