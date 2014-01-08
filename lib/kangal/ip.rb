require 'active_model'
require 'active_model/validations'

class IpValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)

    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?

    object.errors[attribute] << I18n.t(:invalid, scope: 'kangal.validations.ip') unless value =~ /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/i
  end
end