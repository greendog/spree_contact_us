class InquiryMailer < ActionMailer::Base

  def notification(inquiry)
    recipients = MailMethod.current.preferred_mail_bcc.split()
    recipients = MailMethod.current.preferred_intercept_email unless MailMethod.current.preferred_intercept_email.blank?
    @inquiry = inquiry
    mail(
        :from => inquiry.email,
        :to => inquiry.email,
        :subject => "#{Spree::Config[:site_name]} : #{I18n.t(:contact_form)}",
        :bcc => recipients
    )
  end

end
