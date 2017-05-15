module Regista
  class Dispatcher
    def initialize(app, options = {})
      @app = app
      @options = {
        path: '/ul'
      }.merge(options)
    end

    def call(env)
      req = Rack::Request.new(env)
      if req.path == "/ul"
        [200, {'Content-Type' => 'text/plain'}, ["Regista"]]
      else
        @app.call(env)
      end
    end
  end
end
