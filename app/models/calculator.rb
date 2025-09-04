class Calculator < ApplicationRecord
  def self.add(string)
    return 0 if string.empty?
    
    cleaned_string = string.gsub(/[^0-9\-,\n]/, '') #remove all non-numeric characters
    
    numbers = cleaned_string.split(/,|\n/).map(&:to_i)
    numbers.sum
  end
end
