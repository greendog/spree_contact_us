# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_contact_us'
  s.version     = '1.0.0'
  s.summary     = 'Contact Us'
  s.description = 'Contact form with captcha for Spree e-commerce'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Аlехаndеr Nеgоdа'
  s.email             = 'аlехаndеr.nеgоdа@gmаil.cоm'

  #s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.0.0'
  s.add_development_dependency 'rspec-rails'
  s.add_dependency 'recaptcha'
end

