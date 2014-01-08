require 'active_model'
require 'active_model/validations'

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)

    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?

    if options[:tr]
      object.errors[attribute] << I18n.t('kangal.validations.common.invalid') unless value =~ /^(90)+\d{10}$/i
    end

    object.errors[attribute] << I18n.t('kangal.validations.phone.tr') unless value =~ /^\d{11,14}$/i
  end
end