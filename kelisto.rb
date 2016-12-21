class Checkout
	attr_reader :basket
	def initialize
		@basket = {}
	end

	def scan(item)
		!@basket[item]? @basket[item] = 1 : @basket[item]+= 1
	end


end

mybasket = Checkout.new
mybasket.scan("apple")
mybasket.scan("apple")
mybasket.scan("pear")

puts mybasket.basket


