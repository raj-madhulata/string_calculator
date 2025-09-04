require "test_helper"

class CalculatorTest < ActiveSupport::TestCase
  test "empty string return 0" do
    assert_equal 0, Calculator.add("")
  end

  test "single number return the value" do
    assert_equal 1, Calculator.add("1")
    assert_equal 2, Calculator.add("2")
  end
end
