require_relative '../test_helper'

class TskrIntegrationTest < MiniTest::Unit::TestCase
  include DatabaseCleaner

  # def test_list_on_empty_database
  #   assert Task.all.empty?
  #   actual = `./tskr list`
  #   assert_equal "", actual
  # end

  def test_list_with_items
    `./tskr + "foo"`
    `./tskr + "bar"`
    results = `./tskr list`
    assert results.include? ('foo')
    assert results.include? ('bar')
  end

  def test_list_all

  end



end

