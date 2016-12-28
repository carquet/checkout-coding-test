class Checkout

	attr_reader :basket, :pricing_rules
	def initialize(pricing_rules)
		@basket = {}
		@pricing_rules = pricing_rules	
	end

# add item to cart
	def scan(code)
		!@basket[code]? @basket[code] = 1 : @basket[code]+= 1
	end

# calculate total cost 
	def total
		sub_total = 0
			@basket.each do |code, quantity|
				sub_total += @pricing_rules[code]*quantity
			end
		@total = sub_total
		puts "Total without discount: £ #{@total.round(3)}"
		
		discount
	end

# determine appropriate discount according to items
	def discount
		@basket.each do |code, quantity|
			if code == :SR1 && quantity >= 3
				@discount = 4.50
				puts "your strawberry has been reduced of 4.50"
			end

			if code == :GR1 && quantity >=2
				@discount = @pricing_rules[code]
				puts "Buy one green tea get one free!"
			end
		end
		apply_discount
	end


# apply discount when needed
	def apply_discount
		@total -= @discount
		puts "Total price expected: £ #{@total.round(3)}"
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







