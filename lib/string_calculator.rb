class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?("//")
      delimiter_spec, numbers = numbers[2..].split("\n", 2)
      delimiter = delimiter_spec.include?("[") ?
        delimiter_spec.scan(/\[([^\]]+)\]/).map { |(d)| Regexp.escape(d) }.join("|") :
        Regexp.escape(delimiter_spec)
    else
      delimiter = ",|\n"
    end
    
    parsed_numbers = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = parsed_numbers.select(&:negative?)
    
    raise StandardError, "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    
    parsed_numbers.reject { |n| n > 1000 }.sum
  end
end
