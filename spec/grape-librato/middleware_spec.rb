require 'spec_helper'

describe Librato::Grape::Middleware do

  class TestAPI < Grape::API
    use Librato::Grape::Middleware
    get 'hello' do
      "Hello World"
    end
  end

  subject { TestAPI }

  def app
    subject
  end

  it "should send a timing event for each request" do
    Librato.should_receive(:timing).and_yield
    get "/hello"
    last_response.status.should == 200
    last_response.body.should == "Hello World"
  end
end


