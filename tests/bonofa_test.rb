require 'test_helper'
require 'omniauth-bonofa'
require 'openssl'
require 'base64'

class StrategyTest < StrategyTestCase
  include OAuth2StrategyTests
end

class ClientTest < StrategyTestCase
  test 'has correct Bonofa site' do
    assert_equal 'http://shop.opportunity-2014.com', strategy.client.site
  end

  test 'has correct authorize url' do
    assert_equal '/oauth/authorize', strategy.client.options[:authorize_url]
  end

  test 'has correct token url' do
    assert_equal '/oauth/token', strategy.client.options[:token_url]
  end
end
