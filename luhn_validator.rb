# frozen_string_literal: true

# Credit Card Validation
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    parity = (nums_a.length - 1) % 2
    (10 - find_checkbit(nums_a, parity) % 10) % 10 == nums_a[-1]
    # TODO: use the integers in nums_a to validate its last check digit
  end

  def find_checkbit(nums_a, parity)
    nums_a[0..-2].reduce(0) do |final, num|
      single = single_sum(num, parity)
      parity = (parity + 1) % 2
      final + single
    end
  end

  def single_sum(num, parity)
    val = (parity + 1) * num
    val / 10 + val % 10
  end
end
