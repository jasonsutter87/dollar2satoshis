class PricesController < ApplicationController

  def index
    @prices = Price.all
    @bitcoin = Price.find_by(name: "BTC")
    @LastBtcPrice = LastBtcPrice.all
  end
end
