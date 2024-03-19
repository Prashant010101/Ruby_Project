class Product
    attr_accessor :name, :price, :quantity

    def initialize(name, price, quantity)
        @name = name
        @price = price
        @quantity = validate_quantity(quantity)
    end

    def validate_quantity(quantity)
        if quantity > 3
            puts "You can buy 3 #{@name} at a time."
            puts "Please select 3 or less than 3: "
            quantity = gets.chomp.to_i
        end
        quantity
    end

    def display
        "#{@name}\t\t$#{@price}\t\t#{@quantity}"
    end
end

class ShoppingCart 
    def initialize
        @items = []
    end

    def add_items(*products)
        products.each do |product|
            @items << product
            puts "#{product.name} #{product.quantity} units worth $#{product.price * product.quantity} added to cart."
        end
    end

    def remove_items(*products)
        @items -= products
        products.each do |product|
            puts "#{product.name} #{product.quantity} units worth $#{product.price * product.quantity} removed from your cart."
        end
    end

    def show_items
        if @items.empty?
            puts "Your Shopping cart is empty."
        else
            puts "Product\t\tPrice/pcs.\tQuantity"
            @items.each do |item|
                puts item.display
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

puts "Remove Items Y|N?"
answer = gets.chomp.upcase
if answer == 'Y'
    cart1.remove_items(product1)
    puts "\n\nyour Cart now have:\n"
    cart1.show_items
    puts "\nTotal Price: \t\t\t$#{cart1.total_price}"
end
