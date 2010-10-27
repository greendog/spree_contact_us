module Spree::ContactUs
  class Config < Spree::Config
    class << self
      def instance
        return nil unless ActiveRecord::Base.connection.tables.include?('configurations')
        ContactUsConfiguration.find_or_create_by_name("ContactUs configuration")
      end
    end
  end
end