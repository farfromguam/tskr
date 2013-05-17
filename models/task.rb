# "<"
# take everything we know about active record::base
# and share that with Task model
# "extend ActiveRecord::Base"

class Task < ActiveRecord::Base
    # belongs_to :category

    completed = false

end