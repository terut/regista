module Regista
  class App
    def call(env)
      req = Rack::Request.new(env)
      @resource = Resource::Null.find(nil, {})
      render
    end

    private

      def render
        [200, {'Content-Type' => 'text/plain'}, [erb]]
      end

      def erb
        ERB.new(File.read "#{Regista.views}/regista/index.html.erb").result(binding)
      end

      #def render
      #  ERB.new(File.read(layout)).src
      #end
  end
end
