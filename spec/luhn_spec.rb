require 'spec_helper'

RSpec.describe Luhn, type: :model do
  describe 'is_valid? should work' do
    it 'should return true if the number is valid' do
      expect(Luhn.is_valid?(4194560385008504)).to be true
    end

    it 'should return false if the number is not valid' do
      expect(Luhn.is_valid?(4194560385008505)).to be false
    end

    # some credit card numbers are 15 digits
    # these tests confirm the code is starting on the right side, not the left
    it 'should return true if the number is valid and the number has an odd number of digits' do
      expect(Luhn.is_valid?(377681478627336)).to be true
    end

    it 'should return false if the number is not valid and the number has an odd number of digits' do
      expect(Luhn.is_valid?(377681478627337)).to be false
    end





    # https://www.freeformatter.com/credit-card-number-generator-validator.html

    it 'should return true for sample VISA card numbers' do
    	[4024007141015114, 4716131076713585, 4539106258648073831].
    	each{|n|expect(Luhn.is_valid?(n)).to be true}
    end

    it 'should return false for sample fake VISA card numbers' do
    	[4024007141015111, 4716131076713587, 4539106258648073839].
    	each{|n|expect(Luhn.is_valid?(n)).to be false}
    end

    it 'should return true for sample MASTERCARD card numbers' do
    	[2720997477089686, 2720994225890119, 5524572157161336].
    	each{|n|expect(Luhn.is_valid?(n)).to be true}
    end

    it 'should return false for sample fake MASTERCARD card numbers' do
    	[2720997577089686, 2720994225790119, 5584572157161336].
    	each{|n|expect(Luhn.is_valid?(n)).to be false}
    end

    it 'should return true for sample AMEX card numbers' do
    	[342652714629495, 377686737921545, 345978422487273].
    	each{|n|expect(Luhn.is_valid?(n)).to be true}
    end

    it 'should return false for sample fake AMEX card numbers' do
    	[392652714629495, 377686787921545, 345928422487273].
    	each{|n|expect(Luhn.is_valid?(n)).to be false}
    end

    it 'should return true for sample DISCOVER card numbers' do
    	[6011412769298663, 6011524591388114, 6011858685511516678].
    	each{|n|expect(Luhn.is_valid?(n)).to be true}
    end

    it 'should return false for sample fake DISCOVER card numbers' do
    	[6011412569298663, 6011524501388114, 6012858685511516678].
    	each{|n|expect(Luhn.is_valid?(n)).to be false}
    end
  end
end