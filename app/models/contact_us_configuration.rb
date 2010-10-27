class ContactUsConfiguration < Configuration
  preference :contact_form_to, :string, :default => 'to@site.com'
  preference :contact_form_bcc, :string, :default => 'bcc@site.com'
end