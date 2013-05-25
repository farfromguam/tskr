require_relative '../test_helper'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_database_cleaner_working
    assert_equal Task.count, 0
  end

  def test_adding_task_to_existing_category
    `./tskr +category "fatcat"`
    `./tskr + "task" -c fatcat`
    task = Task.where( name: "task" ).first
    assert_equal task.category.name, "fatcat"
  end

  def test_adding_task_to_category_that_does_not_exist
    assert Category.where( name: 'fatcat').all.empty?
    `./tskr + "task" -c fatcat`
    task = Task.where( name: "task" ).first
    assert_equal task.category.name, "fatcat"
  end

  def test_tasks_with_same_category_have_same_category_id
    `./tskr +t task1 -c foo`
    `./tskr +t task2 -c foo`
    task1_category = Task.where( name: 'task1' ).first.category
    task2_category = Task.where( name: 'task2' ).first.category
    assert_equal task1_category, task2_category
  end

end

