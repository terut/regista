$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'regista'

base = Proc.new do |env|
  ['200', { 'Content-Type' => 'text/plain' }, ['Hello world']]
end
run Rack::URLMap.new("/ul" => Regista::Dispatcher.new(base))
