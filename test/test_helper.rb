require 'test/unit'
require_relative '../bootstrap_ar'

connect_to 'test'

ENV['FP_ENV'] = 'test'
    #^--- not sure about this.

module DatabaseCleaner
  def before_setup
    super
    Task.destroy_all
    Category.destroy_all
  end
end