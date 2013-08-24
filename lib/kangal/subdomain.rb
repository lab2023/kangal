require 'active_model'
require 'active_model/validations'

class SubdomainValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return unless value.present?
    reserved_names = %w(www ftp mail pop smtp admin ssl sftp http https)
    reserved_names = options[:reserved] if options[:reserved]
    if reserved_names.include?(value)
      object.errors[attribute] << I18n.t(:reserved, scope: 'kangal.validations.subdomain')
    end

    object.errors[attribute] << I18n.t(:character, scope: 'kangal.validations.subdomain') unless (3..63) === value.length
    object.errors[attribute] << I18n.t(:hyphen, scope: 'kangal.validations.subdomain') unless value =~ /^[^-].*[^-]$/i
    object.errors[attribute] << I18n.t(:alphanumeric, scope: 'kangal.validations.subdomain') unless value =~ /^[a-z0-9\-]*$/i
  end
end