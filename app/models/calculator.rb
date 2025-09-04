class Calculator < ApplicationRecord
  def self.add(string)
    return 0 if string.empty?
    
    cleaned_string = string.gsub(/[^0-9\-,\n]/, '') #remove all non-numeric characters
    
    numbers = cleaned_string.split(/,|\n/).map(&:to_i)

    negatives = numbers.select { |n| n < 0 }
    
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end

    numbers = numbers.select { |n| n >= 0 }
    numbers.sum
  end
end
