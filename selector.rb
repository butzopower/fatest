class Selector
  def initialize(array)
    @array = array
  end

  def select_best
    potentials = []

    # check the right
    #       .]
    #      .
    #     .
    # . [.
    min = @array.min
    min_index = @array.index(min)
    min_array = @array[min_index..-1]
    min_array_max = min_array.max
    min_array_max_index = min_array.index(min_array_max) + min_index
    potentials << [difference([min, min_array_max]), [min_index, min_array_max_index]]

    # check the left
    #    .]
    #   . |
    #  .  |
    #[.   | 
    #     . .
    max = @array.max
    max_index = @array.index(max)
    max_array = @array[0..max_index]
    max_array_min = max_array.min
    max_array_min_index = max_array.index(max_array_min)
    potentials << [difference([max_array_min, max]), [max_array_min_index, max_index]]

    # check the middle
    #   .   
    # .  |   .] 
    #    | . |
    #    |   |
    #   [.   |
    #          .
    if min_index < max_index
      mid_array = @array[min_index+1..max_index-1]
      offset = min_index + 1
    else
      mid_array = @array[max_index+1..min_index-1]
      offset = max_index + 1
    end

    unless mid_array.empty?
      mid_array_min = mid_array.min
      mid_array_max = mid_array.max
      mid_array_min_index = mid_array.index(mid_array_min) + offset
      mid_array_max_index = mid_array.index(mid_array_max) + offset
      potentials << [difference([mid_array_min, mid_array_max]), [mid_array_min_index, mid_array_max_index]]
    end
    
    # grab the potential with the highest difference and return the indexes
    potentials.sort.reverse.first.last
  end

  private

  def difference(tuple)
    tuple.last - tuple.first
  end
end
