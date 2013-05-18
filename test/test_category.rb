require 'test_helper.rb'

class TskrCategoryTests < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_add_a_category
    `./tskr +category "foo"`
    assert_equal 1, Category.count
  end

  def test_deleting_single_category
    `./tskr +category "Alpha"`
    `./tskr -category "Alpha"`
    assert_equal 0, Category.count
  end

  def test_deleting_correct_category
    `./tskr +category "Alpha"`
    `./tskr +category "Beta"`
    `./tskr +category "Charlie"`
    Category.where( name: 'Beta' ).first.destroy
    assert Category.where( name: 'Beta').all.empty?
  end

  def test_deleting_from_command_line
    `./tskr +category "Alpha"`
    `./tskr -category "Alpha"`
    assert_equal 0, Category.count
  end

end