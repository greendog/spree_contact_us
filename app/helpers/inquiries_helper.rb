module InquiriesHelper
  def translate_types
    SpreeContactUs::Config[:inquiry_types].collect { |i| t(i) }
  end
end
