class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      delimiter = Regexp.escape(delimiter)
    else
      delimiter = ",|\n"
    end
    
    parsed_numbers = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = parsed_numbers.select(&:negative?)
    
    if negatives.any?
      raise StandardError, "Negatives not allowed: #{negatives.join(', ')}"
    end
    
    parsed_numbers.sum
  end
end
