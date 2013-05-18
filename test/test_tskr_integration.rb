require 'test_helper.rb'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_database_cleaner_working
    assert_equal Task.count, 0
  end

  def test_add_a_task
    `./tskr + "foo"`
    assert_equal 1, Task.count
  end

  def test_deleting_single_task
    `./tskr + "Alpha"`
    Task.where( name: 'Alpha' ).first.destroy
    assert_equal 0, Task.count
  end

  def test_deleting_correct_task
    `./tskr + "Alpha"`
    `./tskr + "Beta"`
    `./tskr + "Charlie"`
    Task.where( name: 'Beta' ).first.destroy
    assert Task.where( name: 'Beta').all.empty?
  end

end

