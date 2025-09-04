require "test_helper"

class CalculatorTest < ActiveSupport::TestCase
  test "empty string return 0" do
    assert_equal 0, Calculator.add("")
  end

  test "single number return the value" do
    assert_equal 1, Calculator.add("1")
    assert_equal 2, Calculator.add("2")
  end

  test "two numbers separated by comma return the sum" do
    assert_equal 3, Calculator.add("1,2")
    assert_equal 5, Calculator.add("2,3")
  end

  test "multiple numbers separated by comma return the sum" do
    assert_equal 6, Calculator.add("1,2,3")
    assert_equal 10, Calculator.add("1,2,3,4")
  end

  test "handles new lines between numbers" do
    assert_equal 6, Calculator.add("1\n2,3")
    assert_equal 10, Calculator.add("1,2\n3,4")
  end
end
