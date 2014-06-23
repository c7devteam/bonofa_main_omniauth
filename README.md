# Omniauth Bonofa

[Bonofa Shop](http://www.opportunity-2014.com) is an international Sales-Platform with all the functions and aspects of a social network.
 
This gem contains the Bonofa strategy for OmniAuth.

Bonofa uses OAuth 2. This strategy implements the browser variant of the "Sign in with Bonofa" flow.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

Now contact administrator of Bonofa to create an application. Then you should get application_id and secret_key from him.  
Make sure to send a callback URL to administrator or else you may get authentication errors. (It doesn't matter what it is, just that it is set.)

## Usage

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-bonofa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-bonofa

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bonofa, "APPLICATION_ID", "SECRET_KEY"
end
```

or

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :bonofa, "APPLICATION_ID", "SECRET_KEY", {
    site: 'http://www.opportunity-2014.com',
    authorize_url: '/oauth/authorize',
  }
end
```

Replace APPLICATION_ID and SECRET_KEY with the appropriate values you obtained from administrator earlier.

## Authentication Hash

An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  "provider"=>:bonofa_shop,
  "uid"=>1,
  "info"=>
  {
    "email"             => "info@bonofa.com",
    "first_name"        => "Alexander",
    "last_name"         => "Bierbrauer",
    "birthday"           => "1980-01-01",
    "promotion_code"    => "bonofa",
    "profile_image_url" => "http://www.opportunity-2014.com/assets/profile_image_thumb.png",
    "language"          => "en",
    "baio_package"      => "vip_package",
  },
  "credentials"=>
  {
    "token"=>"e8d6f6685e08ca8e3874a36d421de0020d6f714a3576c2c543726b18d5c3ce89",
    "expires_at"=>1391245607,
    "expires"=>true
  },
  "extra"=>{
    "raw_info"=>
    {
      "id"                => 1,
      "email"             => "info@bonofa.com",
      "first_name"        => "Alexander",
      "second_name"       => "Bierbrauer",
      "birthday"           => "1980-01-01",
      "promotion_code"    => "bonofa",
      "profile_image_url" => "http://www.opportunity-2014.com/assets/profile_image_thumb.png",
      "shop_language"     => "en",
      "address"           => "",
      "address_2"         => "",
      "state"             => "",
      "city"              => "",
      "zip"               => "",
      "country"           => "de",
      "phone"             => "",
      "fax"               => "",
      "company"           => "Bonofa",
      "title"             => "Dev Header",
      "baio_package"      => "vip_package",
    }
  }
}
```

## Supported Rubies

OmniAuth Bonofa is tested under 1.8.7, 1.9.2, 1.9.3, 2.0.0, and Ruby Enterprise Edition.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
