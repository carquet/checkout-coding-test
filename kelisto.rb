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

	def show_item
		@basket.each do |item, quantity|
			puts item
			end

	end

	def total
		@basket.each do |item, quantity|
			@total += @pricing_rules[item] * quantity
		end	 
		puts "Total price expected: £ #{@total}"
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
puts mybasket.show_item




