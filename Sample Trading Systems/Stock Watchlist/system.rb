require 'mytradewizard'

class System < MyTradeWizard::StockTradingSystem
  def run

    at 21,00
    
      positions.each do |position|
        preload 206, position.stock
        if SMA(days t-200...t) < SMA(days t-205...t-5)
          if close(t) > close(t-5)
            if close(t) < close(t-205)
              sell position
            end
          end
        end
      end

      orders = []
      watchlist.remove(positions).each do |stock|
        preload 206, stock
        if SMA(days t-200...t) > SMA(days t-205...t-5)
          if close(t) < close(t-5)
            if close(t) > close(t-205)
              orders << (buy stock)
            end
          end
        end
      end
      place orders

    idle 23*HR

  end
end

loop do
  system = System.new
  system.watchlist << ["AAPL", "AMZN", "FB", "GOOG", "NFLX", "TSLA"]
  system.run
  break if system.test?
end