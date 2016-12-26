class Checkout

	attr_reader :basket, :pricing_rules
	def initialize(pricing_rules)
		@basket = {}
		@pricing_rules = pricing_rules	
		
	end

	def scan(code)
		!@basket[code]? @basket[code] = 1 : @basket[code]+= 1
	end



	def discount
		@total = 0
		@basket.each do |code, quantity|
			if  code == :SR1 && quantity >= 3
				 += (@pricing_rules[code] * quantity) - 4.50
			end
			if code == :GR1 && quantity % 3 == 1
				@total += (@pricing_rules[code]* quantity) - @pricing_rules[code]
			end	
				@total += @pricing_rules[code] * quantity
		end	 
		puts "Total price expected: £ #{@total}"
	end


end




pricing_rules = {
	:GR1 => 3.11,
	:SR1 => 5.00,
	:CF1 => 11.23
}


mybasket1 = Checkout.new(pricing_rules)
mybasket1.scan(:GR1)
mybasket1.scan(:SR1)
mybasket1.scan(:GR1)
mybasket1.scan(:GR1)
mybasket1.scan(:CF1)
mybasket1.total

mybasket2 = Checkout.new(pricing_rules)
mybasket2.scan(:GR1)
mybasket2.scan(:GR1)
mybasket2.total

mybasket3 = Checkout.new(pricing_rules)
mybasket3.scan(:SR1)
mybasket3.scan(:SR1)
mybasket3.scan(:GR1)
mybasket3.scan(:SR1)
mybasket3.total






