$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'regista'

use Regista::Dispatcher

run Proc.new { |env| ['200', { 'Content-Type' => 'text/plain' }, ['Hello world']] }
