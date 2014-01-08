require 'kangal/version'
require 'kangal/email'
require 'kangal/subdomain'
require 'kangal/identity_number'
require 'kangal/tax_number'
require 'kangal/ip'
require 'kangal/phone'

I18n.load_path += Dir.glob(File.expand_path('../../config/locales/**/*',__FILE__))
