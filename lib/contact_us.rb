require 'spree_core'
require 'net/http'
require 'recaptcha/rails'
require 'contact_us_hooks'

module ContactUs
  class Engine < Rails::Engine

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      Ability.register_ability(ContactUsAbilityDecorator)
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc
  end
end