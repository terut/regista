module Regista
  class Dispatcher
    WORKAROUNDS = [/l?m\.facebook\.com/, /t\.co/]

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

      def required_redirect?(referer)
        return false if referer.nil?

        uri = URI.parse(referer)
        workaround_hosts.any? { |host| host =~ uri.host }
      end

      def workaround_hosts
        WORKAROUNDS
      end
  end
end
