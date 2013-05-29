require_relative '../test_helper'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_mark_task_as_complete
    `./tskr + "foo"`
    target_id = Task.where( name: 'foo' ).first.id
    `./tskr x #{target_id}`
    assert_equal Task.where( name: 'foo' ).first.complete, true
  end

  def test_unmark_task
    `./tskr + "foo"`
    target_id = Task.where( name: 'foo' ).first.id
    `./tskr xt #{target_id}`
    assert_equal Task.where( name: 'foo' ).first.complete, true

    `./tskr xt! #{target_id}`
    assert_equal Task.where( name: 'foo' ).first.complete, false
  end

end

