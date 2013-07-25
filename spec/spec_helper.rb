require 'rubygems'
require 'bundler/setup'
require 'active_model'
require 'kangal'

class SpecModel

  include ActiveModel::Validations

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

end

#RSpec.configure do |config|
#
#end