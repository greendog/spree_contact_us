Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'contact_us'
  s.version     = '2.0.0'
  s.summary     = 'Contact form for Spree ecommerce engine'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Alexander Negoda'
  s.email             = 'alexander.negoda@gmail.com'
  # s.homepage          = 'http://www.rubyonrails.org'
  # s.rubyforge_project = 'actionmailer'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core')
  s.add_dependency('dynamic_form')
  s.add_dependency('formtastic')
  s.add_dependency('recaptcha')
end
