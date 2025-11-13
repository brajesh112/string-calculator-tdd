# String Calculator

A Ruby implementation of a string calculator that adds numbers from a string input, supporting various delimiters and edge cases.

## Features

- ✅ Add numbers separated by commas
- ✅ Support for newline delimiters
- ✅ Custom single-character delimiters
- ✅ Custom multi-character delimiters
- ✅ Multiple delimiters support
- ✅ Negative number validation with error messages
- ✅ Ignore numbers greater than 1000
- ✅ Empty string handling

## Requirements

- Ruby (tested with Ruby 3.3.5)
- Bundler

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd string_calculator
```

2. Install dependencies:
```bash
bundle install
```

## Usage

```ruby
require_relative 'lib/string_calculator'

# Basic usage
StringCalculator.add("1,2,3")           # => 6
StringCalculator.add("")                 # => 0
StringCalculator.add("5")                # => 5
```

## Examples

### Basic Operations

```ruby
# Empty string returns 0
StringCalculator.add("")                 # => 0

# Single number
StringCalculator.add("1")                # => 1

# Multiple numbers with comma delimiter
StringCalculator.add("1,2")              # => 3
StringCalculator.add("1,2,3,4,5")        # => 15
```

### Newline Delimiters

```ruby
# Comma and newline delimiters
StringCalculator.add("1,2\n3,4\n5")      # => 15
```

### Custom Single-Character Delimiters

```ruby
# Format: //<delimiter>\n<numbers>
StringCalculator.add("//;\n1;2")         # => 3
StringCalculator.add("//|\n1|2|3")       # => 6
```

### Custom Multi-Character Delimiters

```ruby
# Format: //[<delimiter>]\n<numbers>
StringCalculator.add("//[***]\n1***2***3")  # => 6
StringCalculator.add("//[---]\n5---10---15") # => 30
```

### Multiple Delimiters

```ruby
# Format: //[<delimiter1>][<delimiter2>]...\n<numbers>
StringCalculator.add("//[*][%]\n1*2%3")              # => 6
StringCalculator.add("//[*][%][***]\n1*2%3***4")      # => 10
```

### Edge Cases

```ruby
# Negative numbers raise an error
StringCalculator.add("-1,-2,-3")
# => raises StandardError: "Negatives not allowed: -1, -2, -3"

# Numbers greater than 1000 are ignored
StringCalculator.add("1001,2")           # => 2
StringCalculator.add("1000,2")           # => 1002
```

## Running Tests

Run the test suite using RSpec:

```bash
bundle exec rspec
```

To run with verbose output:

```bash
bundle exec rspec --format documentation
```

## Test Coverage

The test suite covers:
- Empty string handling
- Single number input
- Multiple numbers with comma delimiter
- Comma and newline delimiters
- Custom single-character delimiters
- Custom multi-character delimiters
- Multiple delimiters
- Multiple delimiters of varying lengths
- Negative number validation
- Numbers greater than 1000

## Implementation Details

- The calculator uses regex pattern matching to extract custom delimiters
- Negative numbers are validated before processing
- Numbers greater than 1000 are filtered out before summation
- All delimiters are properly escaped to handle special regex characters

## License

This project is open source and available for educational purposes.

