class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i if numbers.length == 1
    num1, num2 = numbers.split(",")
    num1.to_i + num2.to_i
  end
end
