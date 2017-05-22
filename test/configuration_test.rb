require 'test_helper'

class Regista::ConfigurationTest < Regista::Test
  def setup
    Regista.config.reset
  end

  def test_configuration
    assert_equal "/ul", Regista.config.path
  end

  def test_validate
    assert_raises(Regista::ConfigurationError) { Regista.config.validate! }
  end

  class ChangedConfigurationTest < Regista::Test
    def setup
      Regista.configure do |config|
        config.path = "/abc"
      end
    end

    def test_changed_configuration
      assert_equal "/abc", Regista.config.path
    end
  end
end
