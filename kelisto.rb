class Checkout
	attr_reader :basket, :pricing_rules
	def initialize(pricing_rules)
		@basket = {}
		@pricing_rules = pricing_rules
		@total = 0	
	end

	def scan(item)
		!@basket[item]? @basket[item] = 1 : @basket[item]+= 1
	end

	# def change_price_rules(new_price_rules)
	# 	@prices_rules = new_price_rules
	# end
	def total
		@basket.each do |item, quantity|
			@total += @pricing_rules[item]*quantity
		end	
		@total
	end
	
end


pricing_rules = {
	:apple=> 5,
	:pear => 10
}


mybasket = Checkout.new(pricing_rules)
mybasket.scan(:apple)
mybasket.scan(:apple)
mybasket.scan(:pear)

puts mybasket.basket
puts mybasket.pricing_rules
puts mybasket.total




