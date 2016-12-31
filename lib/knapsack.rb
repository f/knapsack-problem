class Knapsack
  def initialize(capacity, mass_of_items, value_of_items)
    @capacity = capacity
    @mass_of_items = mass_of_items.insert(0, 0)
    @value_of_items = value_of_items.insert(0, 0)
    @number_of_items = mass_of_items.size - 1
    @bag = Array.new(@number_of_items + 1) { Array.new(@capacity + 1, 0) }
    @selected_items = Array.new
  end

  def run_algorithm
    for i in 1..@number_of_items do
      for j in 1..@capacity do
        if @mass_of_items[i] > j
          @bag[i][j] = @bag[i-1][j]
        else
          if @bag[i-1][j-@mass_of_items[i]] + @value_of_items[i] > @bag[i-1][j]
            @bag[i][j] = @bag[i-1][j-@mass_of_items[i]] + @value_of_items[i]
          else
            @bag[i][j] = @bag[i-1][j]
          end
        end
      end
    end
    @bag[@number_of_items][@capacity]
  end

  def find_selected_items
    row = @mass_of_items.size - 1
    column = @capacity   
    while row > 0
      if @bag[row][column] > @bag[row-1][column]
        @selected_items << row
        column = column - @mass_of_items[row]
      end
      row -= 1
    end
    @selected_items
  end  
end