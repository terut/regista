module Regista
  class Dispatcher
    def initialize(app, options = {})
      @app = app
      @options = {
        path: '/ul'
      }.merge(options)
    end

    def call(env)
      if env['PATH_INFO'] == @options[:path]
        [200, {'Content-Type' => 'text/plain'}, ["Regista"]]
      else
        @app.call(env)
      end
    end
  end
end
