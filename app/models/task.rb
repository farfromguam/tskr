# "<"
# take everything we know about active record::base
# and share that with Task model
# "extend ActiveRecord::Base"

require 'date'

class Task < ActiveRecord::Base
  belongs_to :category
  # after_initialize :init

  # def init
  #   self.priority = "Normal" if self.priority.nil?
  #   #set default due date for two weeks
  #   self.due_date = DateTime.now + 14 if self.due_date.nil?
  # end

end