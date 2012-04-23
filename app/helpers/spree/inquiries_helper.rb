module Spree::InquiriesHelper
  def inquiry_types_translated
    types = Spree::ContactUsConfiguration[:inquiry_types].dup

    unless types.respond_to? :collect
      types = YAML.load Spree::ContactUsConfiguration[:inquiry_types]
    end

    types.collect { |i| t(i) }
  end
end