module InquiriesHelper
  def inquiry_types_translated
    types = SpreeContactUs::Config[:inquiry_types].dup

    unless types.respond_to? :collect
      types = YAML.load SpreeContactUs::Config[:inquiry_types]
    end

    types.collect { |i| t(i) }
  end
end
