require './selector.rb'
class Security
  include Comparable
  def initialize(name, symbol, prices)
    @name = name
    @symbol = symbol
    @prices = prices
    generate_burst_indexes
  end

  def generate_burst_indexs
    # normalize the prices so they are comparable by % difference
    normalized_prices = @prices.map{|price| Math.log(price) / Math.log(2)}
    @burst_indexes = Selector.new(normalized_prices).select_best
  end

  def burst
    (@prices[@burst_indexes.last] - @prices[@burst_indexes.first]) / @prices[@burst_index.first]
  end

  def <=>(other)
    burst <=> other.burst
  end
end
