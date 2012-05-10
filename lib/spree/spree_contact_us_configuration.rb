module Spree
  class SpreeContactUsConfiguration < Preferences::Configuration
    preference :use_captcha, :boolean, :default => true
    preference :recaptcha_public_key, :string
    preference :recaptcha_private_key, :string
    preference :recaptcha_theme, :string, :default => 'red'
    preference :inquiry_types, :array, :default => [:support, :sales, :website_issue, :suggestion, :other]
  end
end