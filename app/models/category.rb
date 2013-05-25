require 'date'

class Category < ActiveRecord::Base
  has_many :tasks
  validates_uniqueness_of :name

  def init
    self.priority = "Elevated" if self.priority.nil?
    # set default due date for six weeks
    self.due_date = DateTime.now + 42 if self.due_date.nil?
  end

end