module Spree
  class InquiryMailer < ActionMailer::Base

    def notification(inquiry)
      recipients = Spree::MailMethod.current.preferred_mail_bcc.split()
      recipients = Spree::MailMethod.current.preferred_intercept_email unless Spree::MailMethod.current.preferred_intercept_email.blank?
      @inquiry = inquiry
      mail(
        :to => inquiry.email,
        :from => Spree::MailMethod.current.preferred_mails_from,
        :subject => "#{Spree::Config[:site_name]}: #{I18n.t(:contact_form)}",
        :bcc => recipients
      )
    end

  end
end
