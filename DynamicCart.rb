require 'byebug'
class Product
    attr_reader :name, :price, :quantity
  
    def initialize(name, price, quantity)
      @name = name
      @price = price
      @quantity = quantity
    end
  
    def to_s
      "#{@name}: $#{@price} , #{@quantity}"
    end
end

class ShoppingCart
  $tot_price = 0
    attr_reader :items
    def initialize()
      @items = []
    end

    def add_items(product, quantity, obj)
      
      item = { product: product, quantity: quantity }
      @items << item
      puts @items 
      puts "#{quantity} #{product} (s) worth $#{obj.first.price * quantity} added to your cart."
      puts "total price: #{obj.first.price * quantity}" 
      show_cart(product, quantity, obj)
    end

    def remove_item(product)
      @items.delete(product)
    end

    def show_cart(product, quantity, obj)
      puts "\n\nYour Shopping Cart: "
      $tot_price += obj.first.price * quantity  
      @items.each_with_index do |item, index|
        puts "#{item} #{quantity} worth #{obj.first.price}/pcs."
      end
      print "\nGrand Total: $#{$tot_price}"
    end
  end

  puts "Available Products:"
  arr = [
    p1= Product.new("Maggie", 100, 10),
    p2= Product.new("Coffee", 160,10),
    p3= Product.new("Milk", 70,10),
    p4= Product.new("Cheese", 130,10),
    p5= Product.new("Chips", 20,10),  
    p6= Product.new("Coke", 40,10)
  ]
arr.each do |ind|
  puts ind.to_s
end

cart = ShoppingCart.new

loop do
  puts "\nWhat would you like to add to your cart? (Enter 'done' to finish)"
  print "Product name: "
  prod_name = gets.chomp.capitalize
  break if prod_name == 'Done'
  obj = arr.select { |item| item.name== prod_name }
  product = arr.find {|i| i.name == prod_name}

  if product.nil?
    puts "Product not found in cart. Please enter a valid product name."
    next
  end

  print "Quantity: "
  qty = gets.chomp.to_i

  cart.add_items(prod_name, qty, obj)
  
end


puts "Do you want to remove anything? (Y|N)"
ans = gets.chomp.upcase
if ans == 'Y'
  loop do
    puts "\nWhat would you like to remove to your cart? (Enter 'done' to finish)"
    print "Product name: "
    prod_name = gets.chomp.capitalize
    break if prod_name == 'Done'

    product = arr.find {|i| i.name == prod_name}

    if product.nil?
      puts "Product not found in cart. Please enter a valid product name."
      next
    end

    cart.remove_item(prod_name)
    puts "#{prod_name}(s) removed from your cart."
  end
end

puts "Your Udated Cart:\n"








