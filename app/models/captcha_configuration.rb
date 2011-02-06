class CaptchaConfiguration < Configuration
  THEMES = ['red', 'white', 'blackglass', 'clean', 'custom']

  preference :private_key, :string, :default => '6Lehfr8SAAAAACKqvC0GuWegmAWJdMCkb-bSJE1G'
  preference :public_key, :string, :default => '6Lehfr8SAAAAADM2FbXkIyNh7GSzM_vtwfMp9nhC'
  preference :theme, :string, :default => 'red'
  preference :use_captcha, :boolean, :default => true
end
