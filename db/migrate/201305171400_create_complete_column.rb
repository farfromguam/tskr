class CreateCompleteColumn < ActiveRecord::Migration
  def up
    add_column :tasks, :complete, :boolean, :default => 0
  end

  def down
    remove_column :tasks, :complete
  end
end