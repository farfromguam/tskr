require_relative '../test_helper'

class TskrCategoryTests < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_add_a_category
    `./tskr +category "foo"`
    assert_equal 1, Category.count
  end

  def test_deleting_single_category
    `./tskr +category "foo"`
    `./tskr -category "foo"`
    assert_equal 0, Category.count
  end

  def test_deleting_correct_category
    `./tskr +category "foo"`
    `./tskr +category "bar"`
    `./tskr +category "cat"`
    Category.where( name: 'bar' ).first.destroy
    assert Category.where( name: 'bar').all.empty?
  end

  def test_deleting_from_command_line
    `./tskr +category "foo"`
    `./tskr -category "foo"`
    assert_equal 0, Category.count
  end

 def test_duplicate_names_are_ignored
    `./tskr +category "foo"`
    original_category_count = Category.count
    `./tskr +category "foo"`
    assert_equal original_category_count, Category.count
  end

  def test_duplicate_names_outputs_fail
    `./tskr +category "foo"`
    results = `./tskr +category "foo"`
    assert results.include?('Failure.'), "Actually was '#{results}'"
  end

  def test_tasks_with_same_category_have_same_category

  end

end