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
        request_path =
          env['api.endpoint'].
          routes.
          first.
          path[1..-1].
          gsub("/", ".").
          sub(/\(\.:format\)\z/, "")

        metric_name  = "grape.#{req.request_method}.#{request_path}"
        Librato.increment metric_name
        Librato.timing "#{metric_name}.time" do
          @app.call(env)
        end
      end
    end
  end
end
