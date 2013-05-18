class CreateCategory < ActiveRecord::Migration

  def change
    create_table :categories do |t|
      t.string :name
    end

    add_column :tasks, :category_id, :interger
  end

end