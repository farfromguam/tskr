require 'test_helper.rb'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_list_on_empty_database
    assert Task.all.empty?
    actual = `./tskr list`
    assert_equal "", actual
  end

  def test_list_with_items
    `./tskr add "foo"`
    `./tskr add "bar"`
    results = `./tskr list`
    assert results.include? ('foo')
    assert results.include? ('bar')
  end

end

