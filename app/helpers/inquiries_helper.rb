module InquiriesHelper
  def translate_types
    INQUIRY_TYPES.collect { |i| t(i) }
  end
end
