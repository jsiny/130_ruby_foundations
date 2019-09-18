class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = clean_number(number)
    @number = format_number
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end

  def clean_number(number)
    number.gsub(/[ .\-()]/, '')
  end

  def valid_number?
    @number.match?(/\b1?\d{10}\b/)
  end

  def format_number
    if valid_number?
      number.size == 11 ? number[1..-1] : number
    else
      '0000000000'
    end
  end
end

# Done in ~1H with frequent interruptions
