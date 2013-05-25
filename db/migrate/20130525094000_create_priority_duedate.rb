class CreatePriorityDuedate < ActiveRecord::Migration

  def change

    add_column :tasks, :priority, :string
    add_column :tasks, :due_date, :date

    add_column :categories, :priority, :string
    add_column :categories, :due_date, :date

  end

end