INQUIRY_TYPES = [
        :common,
        :orders_and_products,
        :suggestions,
        :other
]

module Spree
  module ContactUs
    class Configuration < Spree::Preferences::Configuration
        preference :use_captcha, :boolean, :default => true
        preference :recaptcha_public_key, :string
        preference :recaptcha_theme, :string
    end
  end
end

Inquiry::Config = Spree::ContactUs::Configuration.new

