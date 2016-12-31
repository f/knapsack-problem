class Knapsack
  def initialize(items)
    @items = items
  end

  def fill_the_bag(capacity)
    return 0 if capacity == 0 || @items.size == 0

    @capacity = capacity
    @weights  = @items.collect{ |item| item[:weight] }.insert(0, 0)
    @prices   = @items.collect{ |item| item[:price] }.insert(0, 0)
    @bag      = (@items.size + 1).times.map {[0] * (capacity+1)}

    (1 .. @items.size).each do |item|
      (1 .. capacity).each do |weight|
        last_item = @bag[item - 1]
        @bag[item][weight] = if @weights[item] > weight
          last_item[weight]
        else
          [last_item[weight - @weights[item]] + @prices[item], last_item[weight]].max
        end
      end
    end
    @bag[@items.size][capacity]
  end

  def inside_bag
    weight = @capacity
    @selected_items = @items.reverse.select.with_index do |item, index|
      i = @items.size - index
      @bag[i][weight] > @bag[i-1][weight] && weight -= item[:weight]
    end
  end
end