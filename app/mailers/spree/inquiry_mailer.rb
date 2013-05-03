module Spree
  class InquiryMailer < ActionMailer::Base

    def notification inquiry
      @inquiry = inquiry

      mail(
        :to => site_owner_email,
        :reply_to => inquiry.email,
        :from => mail_from,
        :subject => "#{Spree::Config[:site_name]} #{I18n.t(:contact_form)}: #{inquiry.inquiry_type}"
      )
    end

    def confirmation inquiry
      @inquiry = inquiry

      mail(
        :to => inquiry.email,
        :reply_to => site_owner_email,
        :from => mail_from,
        :subject => "#{Spree::Config[:site_name]} #{I18n.t(:contact_form)}: #{inquiry.inquiry_type}"
      )
    end

    private

    def mail_from
      Spree::Config[:mails_from]
    end

    def site_owner_email
      Spree::Config[:mails_from]
    end

  end
end
