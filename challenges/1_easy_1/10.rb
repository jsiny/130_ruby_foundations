class Integer
  DEC_TO_ROMAN = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
                   100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X',
                   9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

  def to_roman
    roman_patterns = DEC_TO_ROMAN.clone
    decimal = self
    roman_number = ''
    dec, roman = roman_patterns.shift

    until decimal.zero?
      if decimal >= dec
        roman_number += roman
        decimal -= dec
      else
        dec, roman = roman_patterns.shift
      end
    end

    roman_number
  end
end

# Done in 20 min
