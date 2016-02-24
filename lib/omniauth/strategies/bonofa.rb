require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Bonofa < OmniAuth::Strategies::OAuth2
      option :name, :bonofa

      option :client_options, {
        :site           => "https://shop.bonofa.com",
        :authorize_url  => "/oauth/authorize"
      }

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
          :tree_spot_id  => raw_info["tree_spot_id"],
          :manager_rank  => raw_info["baio_manager_rank"],
          :addressline_1  => raw_info["address"],
          :addressline_2  => raw_info["address_2"],
          :state  => raw_info["state"],
          :city  => raw_info["city"],
          :zip  => raw_info["zip"],
          :country  => raw_info["country"],
          :company  => raw_info["company"],
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
