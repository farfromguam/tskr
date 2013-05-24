class CreatePriorityDuedate < ActiveRecord::Migration

  def change

    add_column :tasks, :priority, :interger
    add_column :tasks, :due_date, :date

    add_column :categories, :priority, :interger
    add_column :categories, :due_date, :date

  end

end