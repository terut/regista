require 'pp'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'regista'

require 'minitest/autorun'

class Regista::Test < Minitest::Test
end

class Regista::ResponseTest < Regista::Test
  attr_reader :request
  def setup
    base = Proc.new do |env|
      ['200', { 'Content-Type' => 'text/plain' }, ['Hello world']]
    end
    app = Regista::Dispatcher.new(base)
    @request = Rack::MockRequest.new(app)
  end
end
