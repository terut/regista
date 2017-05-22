require 'test_helper'

class Regista::DispatcherTest < Regista::ResponseTest
  def test_response
    res = request.get "/"
    assert_equal "text/plain", res.content_type
  end

  def test_regista_response
    res = request.get "/ul"
    assert_equal "text/html", res.content_type
  end
end
