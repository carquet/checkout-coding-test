class Checkout
	attr_reader :basket, :prices_rules
	def initialize(prices_rules)
		@basket = {}
		@prices_rules = prices_rules	
	end

	def scan(item)
		!@basket[item]? @basket[item] = 1 : @basket[item]+= 1
	end

	# def change_price_rules(new_price_rules)
	# 	@prices_rules = new_price_rules
	# end
end

mybasket = Checkout.new({"apple":5, "pear": 10})
mybasket.scan("apple")
mybasket.scan("apple")
mybasket.scan("pear")

puts mybasket.basket
puts mybasket.prices_rules



