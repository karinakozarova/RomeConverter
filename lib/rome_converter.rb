class RomeConverter

  def to_rome(number = self, result = "")
    return result if number == 0
    roman_mapping.keys.each do |divisor|
      quotient, modulus = number.divmod(divisor)
      result << roman_mapping[divisor] * quotient
      return to_rome(modulus, result) if quotient > 0
    end
  end

  def to_dec(str = self, result = 0)
    return result if str.empty?
    roman_mapping.values.each do |roman|
      if str.start_with?(roman)
        result += roman_mapping.invert[roman]
        str = str.slice(roman.length, str.length)
        return to_dec(str, result)
      end
    end
  end

  private

  def roman_mapping
    {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
  end

end
