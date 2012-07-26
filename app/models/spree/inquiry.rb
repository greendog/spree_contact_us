module Spree
  class Inquiry < ActiveRecord::Base
    attr_accessible :name, :message, :email, :phone_number, :inquiry_type, :order_no
    
    validates :name, :message, :presence => true
    validates :email,        :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    after_save :deliver_notification_email

    def deliver_notification_email
      # TODO the only issue here is that if the bcc setting is set on
      # MailMethod.current then the bcc'd address will receive two of
      # the email (one sent to it, and one bcc'd). This is unavoidable until
      # the following pull request is merge:
      # https://github.com/spree/spree/pull/1806

      InquiryMailer.notification(self).deliver
      InquiryMailer.notification(self, true).deliver
    end
  end
end