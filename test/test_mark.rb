require 'test_helper.rb'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_mark_task_as_complete
    `./tskr add "foo"`
    target_id = Task.where( name: 'foo' ).first.id
    `./tskr mark #{target_id}`
    assert_equal Task.where( name: 'foo' ).first.complete, true
  end

  def test_unmark_task
    `./tskr add "foo"`
    target_id = Task.where( name: 'foo' ).first.id
    `./tskr mark #{target_id}`
    assert_equal Task.where( name: 'foo' ).first.complete, true

    `./tskr unmark #{target_id}`
    assert_equal Task.where( name: 'foo' ).first.complete, false
  end

end

