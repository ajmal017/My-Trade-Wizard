require 'mytradewizard'
require 'spec_helper'

describe MyTradeWizard::CME do

  it "returns the first tradable month for Bitcoin according to the CME Group product calendar" do
    [month(0), month(1), month(2)].should include MyTradeWizard::CME.first_month(:BTC)
  end

  it "returns the second tradable month for Bitcoin according to the CME Group product calendar" do
    [month(1), month(2), month(3)].should include MyTradeWizard::CME.second_month(:BTC)
  end

end