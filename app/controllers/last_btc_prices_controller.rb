class LastBtcPricesController < ApplicationController
  def index
    @LastBtcPrice = LastBtcPrice.all
  end
end
