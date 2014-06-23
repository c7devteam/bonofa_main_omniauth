require "omniauth/bonofa/configuration"
require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Bonofa < OmniAuth::Strategies::OAuth2
      option :name, :bonofa

      uid { raw_info["id"] }

      info do
        {
          :email              => raw_info["email"],
          :first_name         => raw_info["first_name"],
          :last_name          => raw_info["last_name"],
          :birthday           => raw_info["birthday"],
          :language           => raw_info["shop_language"],
          :promotion_code     => raw_info["promotion_code"],
          :baio_package       => raw_info["baio_package"],
          :profile_image_url  => raw_info["profile_image_url"],
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, deep_symbolize(Omniauth::Bonofa.configuration.client_options))
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
