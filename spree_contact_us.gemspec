# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_contact_us'
  s.version     = '1.1.1'
  s.summary     = 'Contact Us'
  s.description = 'Contact form with captcha for Spree e-commerce'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Alexander Negoda'
  s.email             = 'alexander.negoda@gmail.com'

  #s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.0.beta'
  s.add_dependency 'recaptcha'

  s.add_development_dependency 'factory_girl', '2.6.4'
  s.add_development_dependency 'rspec-rails',  '~> 2.9.0'
  s.add_development_dependency 'shoulda-matchers', '~> 1.4.0'
  s.add_development_dependency 'sqlite3'
end
