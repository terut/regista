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
        @title = "Regista"
        [200, {'Content-Type' => 'text/plain'}, [erb]]
      else
        @app.call(env)
      end
    end

    def erb
      ERB.new(File.read "#{Regista.views}/index.html.erb").result(binding)
    end

    #def render
    #  ERB.new(File.read(layout)).src
    #end
  end
end
