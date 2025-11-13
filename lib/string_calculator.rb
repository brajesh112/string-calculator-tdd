class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      delimiter = Regexp.escape(delimiter)
    else
      delimiter = ",|\n"
    end
    
    numbers.split(/#{delimiter}/).map(&:to_i).sum
  end
end
