require 'test_helper'
require 'omniauth-bonofa'

class StrategyTest < StrategyTestCase
  include OAuth2StrategyTests
end

class ConfigurationTest < StrategyTestCase
  test "should set the configuration vars from site url" do
    Omniauth::Bonofa.configure do |config|
      config.site = "http://www.bonofa-test.com"
    end
    assert_equal Omniauth::Bonofa.configuration.site, "http://www.bonofa-test.com"
    assert_equal 'http://www.bonofa-test.com', strategy.client.site
  end

  test "should set configuration vars" do
    Omniauth::Bonofa.configure do |config|
      config.authorize_url = "/oauth/authorize"
    end
    assert_equal Omniauth::Bonofa.configuration.authorize_url, "/oauth/authorize"
  end
end
