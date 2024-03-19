class Product
    attr_accessor :name, :price, :quantity
    def initialize(name, price, quantity)
        @name = name
        @price = price
        @quantity = quantity
        if quantity > 3
            puts "You can buy 3 #{name} at a time."
            puts "Please select 3 or less than 3: "
            @quantity = gets.chomp.to_i
            puts "Product       Price/pcs.      Quantity"
            puts

        end
    end
    def display
        
        puts
        puts "#{@name}          $#{@price}             #{quantity}"
        puts
    end
end

class ShoppingCart 
    def initialize
        @items = []
    end

    def add_items(*products)
        products.each do |product|
            @items << product
        end
    end

    def show_items
        if @items.empty?
            puts "Your Shopping cart is empty."
        else
            @items.each_with_index do |item, index|
                print "#{item.display}"
            end
        end
    end
    def total_price
        sum = 0
        @items.each do |item|
            sum += item.price * item.quantity
        end
        sum  
    end
end

product1 = Product.new("Maggie", 100, 10)
product2 = Product.new("Coffee", 160, 1)
product3 = Product.new("Milk", 70, 2)
product4 = Product.new("Cheese", 130, 3)
product5 = Product.new("Chips", 20, 2)
product6 = Product.new("Coke", 40, 3)

cart1 = ShoppingCart.new
cart1.add_items(product1, product2, product4)
cart1.show_items
puts "\nTotal Price: \t\t\t$#{cart1.total_price}"

