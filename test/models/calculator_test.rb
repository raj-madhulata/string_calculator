require "test_helper"

class CalculatorTest < ActiveSupport::TestCase
  test "empty string return 0" do
    assert_equal 0, Calculator.add("")
  end
end
