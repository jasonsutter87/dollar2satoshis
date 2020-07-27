namespace :dts do
  desc "get the prices from the db, and sent it to twitter"
  task :update_twitter_prices => :environment do


    #get last prices for USD, GBP, EUR, JPY KRW
    all_prices = Price.where(name: ["USD", "GBP", "EUR", "JPY", "KRW"])
    bitcoin = LastBtcPrice.last.price
    body = "Dollar 2 Satoshi Last Price for:\n"
    # body += "Bitcoin Current price $#{ (100000000 / bitcoin ).round(2) }USD\n\n"
    all_prices.each do |currencies|
         # p currencies.name + ": " + (((1 / currencies.price.to_f) * bitcoin.to_f) * 100000000).round(3).to_s

         body += currencies.name
         body += ": "
         body += (((1 / currencies.price.round(3).to_f) * bitcoin.to_f) * 100000000).round(3).to_s
         body += "Sats"
         body += "\n"
    end
    body += "\n"
    p body += "#Bitcoin #BTC #USD #GBP #EUR #JPY #KRW"


    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['API_KEY']
      config.consumer_secret     = ENV['API_SECRET_KEY']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end


    client.update(body)






    puts "It works!"
  end

end





Dollar 2 Satoshi Last Price for:
EUR: 11392.744Sats
GBP: 12473.594Sats
JPY: 92.241Sats
KRW: 8.133Sats
USD: 9729.404Sats


#Bitcoin #BTC #USD #GBP #EUR #JPY #KRW
