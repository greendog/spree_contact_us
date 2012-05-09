module SpreeContactUs
  class Engine < Rails::Engine
    engine_name 'spree_contact_us'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree.spree_contact_us.preferences", :after => "spree.environment" do |app|
      Spree::ContactUsConfiguration = Spree::SpreeContactUsConfiguration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Spree::Ability.register_ability(::ContactUsAbility)
    end

    config.to_prepare &method(:activate).to_proc
  end
end