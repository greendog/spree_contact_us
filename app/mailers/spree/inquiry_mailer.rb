module Spree
  class InquiryMailer < ActionMailer::Base

    def notification(inquiry, customer = false)
      @inquiry = inquiry

      # rather use reply-to for spam reasons (the email really isn't coming from the user)
      # but it's not possible: http://productforums.google.com/forum/#!topic/gmail/azLFdnPfRZo

      mail(
        :to => inquiry.email,
        :subject => "#{Spree::Config[:site_name]} #{I18n.t(:contact_form)}: #{inquiry.inquiry_type}",
        :from => Spree::MailMethod.current.preferred_mails_from,
        :bcc => Spree::MailMethod.current.preferred_mail_bcc
      )
    end

  end
end
