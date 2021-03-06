require "rome_converter"

RSpec.describe RomeConverter, "#both" do

  context "testing conversion of roman numbers to decimal and back to roman: " do
    res = RomeConverter.new

    it "loop through all examples to make sure every single number works back and forth between to_dec and to_rome" do
      for i in 0..4999 do
          result = res.to_rome(i);
          expect(res.to_dec(result)).to eq i
        end
      end
    end
  end


  context "testing conversion of integers to roman numbers: " do
    res = RomeConverter.new

    it "tests nums 1 to 5" do
      expect(res.to_rome(1)).to eq "I"
      expect(res.to_rome(2)).to eq "II"
      expect(res.to_rome(3)).to eq "III"
      expect(res.to_rome(4)).to eq "IV"
      expect(res.to_rome(5)).to eq "V"
    end

    it "tests nums 6 to 10" do
      expect(res.to_rome(6)).to eq "VI"
      expect(res.to_rome(7)).to eq "VII"
      expect(res.to_rome(8)).to eq "VIII"
      expect(res.to_rome(9)).to eq "IX"
      expect(res.to_rome(10)).to eq "X"
    end

    it "tests 0" do
      expect(res.to_rome(0)).to eq ""
    end

    it "tests 2017" do
      expect(res.to_rome(2017)).to eq "MMXVII"
    end
    it "tests 4999(max)" do
      expect(res.to_rome(4999)).to eq "MMMMCMXCIX"
    end

    it "big nums" do
      expect(res.to_rome(43)).to eq "XLIII"
      expect(res.to_rome(55)).to eq "LV"
      expect(res.to_rome(77)).to eq "LXXVII"
      expect(res.to_rome(123)).to eq "CXXIII"
      expect(res.to_rome(164)).to eq "CLXIV"
      expect(res.to_rome(1221)).to eq "MCCXXI"
      expect(res.to_rome(1999)).to eq "MCMXCIX"
      expect(res.to_rome(2222)).to eq "MMCCXXII"
    end

    it "tests 10,100 and 1000" do
      expect(res.to_rome(10)).to eq "X"
      expect(res.to_rome(100)).to eq "C"
      expect(res.to_rome(1000)).to eq "M"
    end

    it "tests 50 and 500" do
      expect(res.to_rome(50)).to eq "L"
      expect(res.to_rome(500)).to eq "D"
    end

    it "tests 40 and 400" do
      expect(res.to_rome(40)).to eq "XL"
      expect(res.to_rome(400)).to eq "CD"
    end

    it "tests 90 and 900" do
      expect(res.to_rome(90)).to eq "XC"
      expect(res.to_rome(900)).to eq "CM"
    end

  end


  context "testing conversion of roman numbers to decimal: " do
    res = RomeConverter.new

    it "tests nums 1 to 5" do
      expect(res.to_dec("I")).to eq 1
      expect(res.to_dec("II")).to eq 2
      expect(res.to_dec("III")).to eq 3
      expect(res.to_dec("IV")).to eq 4
      expect(res.to_dec("V")).to eq 5
    end

    it "tests nums 6 to 10" do
      expect(res.to_dec("VI")).to eq 6
      expect(res.to_dec("VII")).to eq 7
      expect(res.to_dec("VIII")).to eq 8
      expect(res.to_dec("IX")).to eq 9
      expect(res.to_dec("X")).to eq 10
    end

    it "tests 0" do
      expect(res.to_dec("")).to eq 0
    end

    it "tests 2017" do
      expect(res.to_rome(2017)).to eq "MMXVII"
    end

    it "tests 4999(max) " do
      expect(res.to_dec("MMMMCMXCIX")).to eq 4999
    end

    it "tests 10,100 and 1000" do
      expect(res.to_dec("X")).to eq 10
      expect(res.to_dec("C")).to eq 100
      expect(res.to_dec("M")).to eq 1000
    end

    it "tests 50 and 500" do
      expect(res.to_dec("L")).to eq 50
      expect(res.to_dec("D")).to eq 500
    end

    it "tests 40 and 400" do
      expect(res.to_dec("XL")).to eq 40
      expect(res.to_dec("CD")).to eq 400
    end

    it "tests 90 and 900" do
      expect(res.to_dec("XC")).to eq 90
      expect(res.to_dec("CM")).to eq 900
    end

    it "big nums" do
      expect(res.to_dec("XLIII")).to eq 43
      expect(res.to_dec("LV")).to eq 55
      expect(res.to_dec("LXXVII")).to eq 77
      expect(res.to_dec("CXXIII")).to eq 123
      expect(res.to_dec("CLXIV")).to eq 164
      expect(res.to_dec("MCCXXI")).to eq 1221
      expect(res.to_dec("MCMXCIX")).to eq 1999
      expect(res.to_dec("MMCCXXII")).to eq 2222
    end
  end
