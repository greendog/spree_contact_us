class ContactUsConfiguration < Configuration
  preference :contact_form_to, :string, :default => 'alexander.negoda@gmail.com'
  preference :contact_form_bcc, :string, :default => 'admin@site.com'
end