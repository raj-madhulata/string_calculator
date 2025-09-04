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

  test "handles both commas and new lines as delimiters" do
    assert_equal 10, Calculator.add("1\n2,3\n4")
    assert_equal 15, Calculator.add("1,2\n3,4\n5")
  end

  test "ignores non-numeric values" do
    assert_equal 3, Calculator.add("1,2,sdfs")
    assert_equal 8, Calculator.add("1,twddo,3,4")
  end

  test "negatives not allowed" do
    error1 = assert_raises(RuntimeError) { Calculator.add("1,2,-3") }
    assert_match /negative numbers not allowed: -3/, error1.message
              
    error2 = assert_raises(RuntimeError) { Calculator.add("1,-2,3,4") }
    assert_match /negative numbers not allowed: -2/, error2.message
    
    error3 = assert_raises(RuntimeError) { Calculator.add("1,-2,3,-4") }
    assert_match /negative numbers not allowed: -2,-4/, error3.message
  end
    
end
