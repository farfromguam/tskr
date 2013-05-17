require 'test/unit'
require_relative '../bootstrap_ar'

module DatabaseCleaner
  def before_setup
    super
    Task.destroy_all
  end
end