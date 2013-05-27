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
    `./tskr -category "bar"`
    assert Category.where( name: 'bar').all.empty?
  end

  def test_deleting_from_command_line
    `./tskr +category "foo"`
    `./tskr -category "foo"`
    assert_equal 0, Category.count
  end

 def test_duplicate_category_names_are_ignored
    `./tskr +category "foo"`
    original_category_count = Category.count
    `./tskr +category "foo"`
    assert_equal original_category_count, Category.count
  end

  def test_duplicate_category_names_outputs_fail
    `./tskr +category "foo"`
    results = `./tskr +category "foo"`
    assert results.include?('Failure.'), "Actually was '#{results}'"
  end

  def test_category_can_have_priority
    `./tskr +cat foo -p "very important"`
    category = Category.where( name: "foo" ).first
    assert_equal category.priority, "very important"
  end

  # def test_category_can_have_due_date
  #   `./tskr +cat foo -d "2001-02-03"`
  #   category = Category.where( name: "foo" ).first
  #   assert_equal "2001-02-03", category.due_date
  # end

end