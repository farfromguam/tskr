require_relative '../test_helper'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test
    assert_equal true, true
  end

  def test_database_cleaner_working
    assert_equal Task.count, 0
  end

  def test_add_a_task
    `./tskr + "foo"`
    assert_equal 1, Task.count
  end

  def test_deleting_single_task
    `./tskr + "foo"`
    Task.where( name: 'foo' ).first.destroy
    assert_equal 0, Task.count
  end

  def test_deleting_correct_task
    `./tskr + "foo"`
    `./tskr + "bar"`
    `./tskr + "cat"`
    Task.where( name: 'bar' ).first.destroy
    assert Task.where( name: 'bar').all.empty?
  end

  def test_adding_task_to_existing_category
    `./tskr +category "fatcat"`
    `./tskr + "task" -c fatcat`
    list = `./tskr list`
    assert list.include? ('task')
    # assert list.include? ('fatcat')
  end

  def test_adding_task_to_category_that_does_not_exist
    assert Category.where( name: 'fatcat').all.empty?
    `./tskr + "task" -c fatcat`
    list = `./tskr list`
    assert list.include? ('task')
    # assert list.include? ('fatcat')
  end

end

