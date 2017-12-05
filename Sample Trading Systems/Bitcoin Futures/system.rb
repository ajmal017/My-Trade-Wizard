require 'mytradewizard'

class System < MyTradeWizard::FutureTradingSystem 
  def run

    at 12,55

    signal = 0
  	(hours 4...13).each do |bar|
  	  signal += 1 if bar.close > bar.open
  	  signal -= 1 if bar.close < bar.open
  	end
    actionize signal

  	email "Signal: #{signal}, Action: #{action}"

    place_orders "13:00:00 UTC", "21:00:00 UTC"

    idle 23*HR

  end
end

loop do
  system = System.new
  system.symbol = :BTC
  system.quantity = 1..2
  system.run
  break if system.test?
end