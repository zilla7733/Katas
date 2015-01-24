
class Item
  attr_accessor :name, :uom, :price, :discount
  def initialize name, uom, price, discount
    @name = name
    @uom = uom
    @price = price
    @discount = discount
  end

end

class SuperMarket

  def initialize
    @itemList = []
    @itemList << Item.new("bread", "each", 1, 5)
    @itemList << Item.new("noodles", "each", 0.5, 3)
    @itemList << Item.new("soupcan", "each", 2, 0)
    @itemList << Item.new("apples", "pound", 2, 0)

    @total = 0
    @cart = Hash.new
    InitializeCart()
  end

  def calculateCost(itemName, quantity = 1.0)
    item = GetItem(itemName)
    adjusted_quantity = quantity - quantity / item.discount
    cost = item.cost * adjusted_quantity
    (1..quantity).each do
      @cart[itemName] = @cart[itemName] + 1
      itemCost = item.price
      itemCost = 0 if item.discount == @cart[itemName]
      cost = cost + itemCost
      puts "Item: #{item.name}  $#{item.price}/#{item.uom} Total Price: #{itemCost}"
    end

    @total = @total + cost

    return cost
  end

  def GetItem itemName
    @itemList.each{ |item|
      return item if item.name == itemName
    }
  end

  def getTotal
    puts "Total:        #{@total}"
    InitializeCart()
    return @total
  end

  def InitializeCart
    @itemList.each{
      |item|
      @cart[item.name] = 0
    }
  end
end
