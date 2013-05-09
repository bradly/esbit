require 'spec_helper'

describe Esbit::Campfire do
  let(:campfire) { Esbit::Campfire.new('subdomain', 'token') }

  before(:each) do
    RestClient.stub(:get).and_return(MOCK_ROOMS_API_RESPONSE)
  end

  describe "initialization" do
    it "should accept a subdomain and token" do
      campfire.subdomain.should eql 'subdomain'
      campfire.token.should eql 'token'
    end

    it "should setup a connection" do
      campfire.connection.should be_a Esbit::Connection
    end
  end

  describe "rooms" do
    it "should return an array of rooms" do
      campfire.rooms.all? { |room| room.is_a? Esbit::Room }.should be_true
    end

    it "should only make one request" do
      RestClient.should_receive(:get).once
      3.times { campfire.rooms }
    end
  end

  describe "finding rooms" do
    it "should find a room by id" do
      campfire.find_room_by_id(1).name.should eql "Chat Room 1"
    end

    it "should find a room by name" do
      campfire.find_room_by_name("Chat Room 2").id.should eql 2
    end
  end
end
