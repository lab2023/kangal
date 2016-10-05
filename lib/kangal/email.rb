require 'active_model'
require 'active_model/validations'
require 'mail'

class EmailValidator < ActiveModel::EachValidator

  def validate_each(object, attribute, value)

    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?

    begin
      m = Mail::Address.new(value)
      r = m.domain && m.address == value
    rescue Exception => e
      r = false
    end
    object.errors.add attribute, (options[:message] || I18n.t(:invalid, :scope => 'kangal.validations.email')) unless r
  end

end