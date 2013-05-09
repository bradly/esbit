require 'spec_helper'

describe Esbit::Campfire do
  describe "initialization" do
    let(:campfire) { Esbit::Campfire.new('subdomain', 'token') }

    it "should accept a subdomain and token" do
      campfire.subdomain.should eql 'subdomain'
      campfire.token.should eql 'token'
    end

    it "should setup a connection" do
      campfire.connection.should be_a Esbit::Connection
    end
  end
end
