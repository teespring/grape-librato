require 'grape'
require 'librato-rack'

module Librato
  module Grape
    class Middleware < ::Grape::Middleware::Base
      def initialize(app)
        @app = app
      end

      def call(env)
        req = ::Rack::Request.new(env)
        request_path = env['api.endpoint'].routes.first.route_path[1..-1].gsub("/", ".").sub(/\(\.:format\)\z/, "") 
        Librato.timing "#{req.request_method}.#{request_path}" do
          @app.call(env)
        end
      end
    end
  end
end
