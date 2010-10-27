require 'spree_core'
require 'contact_us_hooks'

module ContactUs
  class Engine < Rails::Engine

    def self.activate

    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc
  end
end