require 'test_helper.rb'

class TskrIntegrationTest < Test::Unit::TestCase

  def test_0_is_it_working
    assert_equal(true, true)
  end

  def test_takes_arguments_and_saves_them
    #start with nothing
    assert_equal Task.count, 0
    #run 'ruby tskr add task foo'
    Task.create( name: 'foo' )
    #end up with foo task
    assert_equal Task.count, 1
  end

end

