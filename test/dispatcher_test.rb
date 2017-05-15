require 'test_helper'

class Regista::DispatcherTest < Regista::ResponseTest
  def test_response
    res = request.get "/ul/ul"
    assert_equal "Hello world", res.body
  end
end
