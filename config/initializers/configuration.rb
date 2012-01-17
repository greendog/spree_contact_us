module Spree
  module ContactUs
    class Configuration < Spree::Preferences::Configuration
      preference :use_captcha, :boolean, :default => true
      preference :recaptcha_public_key, :string
      preference :recaptcha_theme, :string
      preference :inquiry_types, :array, :default => [:common, :orders_and_products, :suggestions, :other]
    end
  end
end
