class Product
    attr_accessor :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
    def display
        puts "#{@name} $#{@price}"
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
            sum += item.price
        end
        sum  
    end
end

product1 = Product.new("Maggie", 100)
product2 = Product.new("Coffee", 160)
product3 = Product.new("Milk", 70)
product4 = Product.new("Cheese", 130)
product5 = Product.new("Chips", 20)
product6 = Product.new("Coke", 40)

cart1 = ShoppingCart.new
cart1.add_items(product1, product2, product4)
cart1.show_items
puts "\nTotal Price: $#{cart1.total_price}"

