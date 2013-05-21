class Category < ActiveRecord::Base
  has_many :tasks
  validates_uniqueness_of :name

end