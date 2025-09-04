class Calculator < ApplicationRecord
  def self.add(string)
    return 0 if string.empty?

    numbers = string.split(/,|\n/).map(&:to_i)
    numbers.sum
  end
end
