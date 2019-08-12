module Luhn
	def self.is_valid?(number)
		i = sum = 0
		
		while number > 0 do
			d = number % 10
			number /= 10
			sum += i % 2 == 0 ? d : d * 2 > 9 ? 2 * d - 9 : 2 * d
			i += 1
		end

		sum % 10 == 0		
	end
end