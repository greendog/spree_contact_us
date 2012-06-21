module Spree
  class Inquiry < ActiveRecord::Base
    attr_accessible :name, :message, :email, :phone_number, :inquiry_type, :order_no
    
    validates :name, :message, :presence => true
    validates :email,        :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    after_save :deliver_notification_email

    def deliver_notification_email
      InquiryMailer.notification(self).deliver
    end
  end
end