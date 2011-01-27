class Selector
  def initialize(array)
    @array = array
  end

  def select_best
    min = @array.min
    min_index = @array.index(min)
    best_min = [min, @array[min_index..-1].max]
    max = @array.max
    max_index = @array.index(max)
    best_max = [@array[0..max_index].min, max]
    difference(best_min) > difference(best_max) ? best_min : best_max
  end

  private

  def difference(tuple)
    tuple.last - tuple.first
  end
end
