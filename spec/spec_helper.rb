require 'rubygems'
require 'bundler/setup'
require 'active_model'
require 'cerberus'

class SpecModel

  include ActiveModel::Validations

  def initialize(attributes = {})
    @attributes = attributes
  end

end

#RSpec.configure do |config|
#
#end