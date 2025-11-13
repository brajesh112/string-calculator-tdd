require "spec_helper"
require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers separated by a comma" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of many numbers separated by a comma" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it "returns the sum of many numbers separated by a comma and a new line" do
      expect(StringCalculator.add("1,2\n3,4\n5")).to eq(15)
    end

    it "returns the sum of number separated by a custom delimiter" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "returns the throw exception negatives not allowed for a negative number with negative numbers" do
      expect { StringCalculator.add("-1,-2,-3") }.to raise_error(StandardError, "Negatives not allowed: -1, -2, -3")
    end
  end
end
