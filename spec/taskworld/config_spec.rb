require 'spec_helper'

RSpec.xdescribe Taskworld::Config do
  describe '#configure' do
    let(:server) { 'Asia' }
    before do
      Taskworld.configure do |config|
        config.server = server
      end
    end
    it 'sets server' do
      expect(Taskworld.config.server).to eq server
    end
  end

  describe '#reset' do
    let(:server) { 'Asia' }
    before do
      Taskworld.configure do |config|
        config.server = server
      end
    end

    subject { Taskworld.configure.reset }
    it 'config reset' do
      subject
      expect(Taskworld.config.server).to be_nil
    end
  end
end
