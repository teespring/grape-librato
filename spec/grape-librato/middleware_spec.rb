require 'spec_helper'

describe Librato::Grape::Middleware do

  class TestAPI < Grape::API
    use Librato::Grape::Middleware
    get 'hello/:name' do
      "hello #{params['name']}"
    end
  end

  def app; TestAPI; end

  it "should send an increment and  timing event for each request" do
    Librato.should_receive(:increment).with('grape.GET.hello.:name')
    Librato.should_receive(:timing).with('grape.GET.hello.:name.time').and_yield
    get "/hello/sean"
    last_response.status.should == 200
    last_response.body.should == "hello sean"
  end
end

