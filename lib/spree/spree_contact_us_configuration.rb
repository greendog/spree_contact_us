module Spree
  module ContactUs
    class Configuration < Spree::Preferences::Configuration
      preference :use_captcha, :boolean, :default => true
      preference :recaptcha_public_key, :string
      preference :recaptcha_theme, :string, :default => 'red'
      preference :inquiry_types, :array, :default => [:question_about_order, :suggestion, :products, :website_issue, :other]
    end
  end
end
