require 'test_helper.rb'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_0_is_it_working
    assert_equal(true, true)
  end

  def test_no_records_in_database
    assert_equal Task.count, 0
  end

  def test_add_a_task
    Task.create( name: 'foo' )
    assert_equal 1, Task.count
  end

  def test_deleting_a_task
    Task.create( name: 'Alpha' )
    Task.create( name: 'Beta' )
    Task.create( name: 'Charlie' )
    Task.where( name: 'Beta' ).first.destroy
    assert_equal 2, Task.count
    assert Task.where( name: 'Beta').all.empty?
  end

  def test_list_on_empty_database
    assert Task.all.empty?
    actual = `./tskr list`
    assert_equal "", actual
  end

  def test_list_with_items
    Task.create(name: 'foo')
    Task.create(name: 'bar')
    results = `./tskr list`
    assert results.include? ('foo')
    assert results.include? ('bar')
  end

  def using_tskr_on_command_line

  end


end

