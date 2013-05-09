require 'spec_helper'

describe Esbit::Connection do
  let(:campfire) { Esbit::Campfire.new('subdomain', 'token') }
  let(:connection) { Esbit::Connection.new(campfire) }

  describe "urls" do
    it "should set a base_url with token and subdomain" do
      connection.send(:base_url).should start_with('https://token@subdomain.')
    end

    it "should construct a request url" do
      connection.send(:request_url, 'rooms').should eql 'https://token@subdomain.campfirenow.com/rooms.json'
    end
  end

  describe "get" do
    it "handle response after the request is made" do
      url = 'https://token@subdomain.campfirenow.com/rooms.json'
      json_string = '{"test":"json"}'
      RestClient.stub('get').and_return(json_string)
      connection.should_receive(:handle_response).with(json_string)
      connection.get('rooms')
    end

    it "should make a request to a path" do
      url = 'https://token@subdomain.campfirenow.com/rooms.json'
      RestClient.should_receive('get').with(url, {}).and_return('{}')
      connection.get('rooms')
    end

    it "should allow optional parameters" do
      url = 'https://token@subdomain.campfirenow.com/rooms.json'
      RestClient.should_receive('get').with(url, {some_param: 42}).and_return('{}')
      connection.get('rooms', some_param: 42)
    end
  end

  describe "post" do
    it "should make post a request to a path" do
      url = 'https://token@subdomain.campfirenow.com/rooms.json'
      RestClient.should_receive('post').with(url, {}).and_return('{}')
      connection.post('rooms')
    end

    it "should allow optional parameters" do
      url = 'https://token@subdomain.campfirenow.com/rooms.json'
      RestClient.should_receive('post').with(url, {some_param: 42}).and_return('{}')
      connection.post('rooms', some_param: 42)
    end

    it "handle response after the request is made" do
      url = 'https://token@subdomain.campfirenow.com/rooms.json'
      json_string = '{"test":"json"}'
      RestClient.stub('post').and_return(json_string)
      connection.should_receive(:handle_response).with(json_string)
      connection.post('rooms')
    end
  end

  describe "handle_response" do
    it "should parse json" do
      json_string = '{"test":"json"}'
      connection.send(:handle_response, json_string).should eql({"test" => "json"})
    end
  end
end

