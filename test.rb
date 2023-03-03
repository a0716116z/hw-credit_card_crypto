# frozen_string_literal: true

def validate_checksum(number)
  nums_a = number.to_s.chars.map(&:to_i)
  parity =  (nums_a.length - 1) % 2
  check_bit = nums_a[0..-2].reduce(0) do |final, num|
    val = (parity + 1) * num
    single_sum = val / 10 + val % 10
    parity = (parity + 1) % 2
    final + single_sum
  end
  (10 - check_bit % 10) % 10 == nums_a[-1]
  # TODO: use the integers in nums_a to validate its last check digit
end
number = '79927398714'
puts validate_checksum(number)
