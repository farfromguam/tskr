require_relative '../test_helper'

class TskrTaskTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

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

  def test_task_can_have_priority
    `./tskr +t foo -p "very important"`
    task = Task.where( name: "foo" ).first
    assert_equal task.priority, "very important"
  end

  # def test_task_can_have_due_date
  #   `./tskr +t foo -d "2001-02-03"`
  #   task = Task.where( name: "foo" ).first
  #   assert_equal task.due_date, "2001-02-03"
  # end

end