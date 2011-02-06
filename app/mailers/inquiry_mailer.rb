class InquiryMailer < ActionMailer::Base

  def notification(inquiry, resend=false)
    subject "#{Spree::Config[:site_name]} : #{I18n.t(:contact_form)}"
    body :inquiry => inquiry
    recipients MailMethod.current.preferred_intercept_email
    bcc "#{MailMethod.current.preferred_mail_bcc}, #{inquiry.email}"
    from inquiry.email
    content_type "text/html"
  end

end
