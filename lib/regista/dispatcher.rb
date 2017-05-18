module Regista
  class Dispatcher
    def initialize(app, options = {})
      @app = app
      @options = {
        path: "/ul"
      }.merge(options)
    end

    def call(env)
      req = Rack::Request.new(env)
      if req.path == options[:path]
        App.new.call(env)
      else
        @app.call(env)
      end
    end

    private

      def options
        @options
      end
  end
end
