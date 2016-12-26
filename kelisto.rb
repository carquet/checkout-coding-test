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
		@total_discount = 0
		@basket.each do |code, quantity|
			if  code != :SR1 && quantity % 2 == 0
				@total_discount = (@pricing_rules[code]* quantity)/2
			else
				@total_discount += @pricing_rules[code] * quantity
			end



			 
		end
	end


	def total
		@total = 0
		@basket.each do |code, quantity|
			if discount
				@total += @total_discount
			else
			@total += @pricing_rules[code] * quantity
			end
		@total
		end	 
		puts "\n Total price expected: £ #{@total}"
	end
end




pricing_rules = {
	:GR1 => 3.11,
	:SR1 => 5.00,
	:CF1 => 11.23
}


mybasket = Checkout.new(pricing_rules)
# mybasket.scan(:GR1)
# mybasket.scan(:GR1)
mybasket.scan(:SR1)
mybasket.scan(:SR1)

# puts mybasket.basket
# puts mybasket.pricing_rules
mybasket.total





