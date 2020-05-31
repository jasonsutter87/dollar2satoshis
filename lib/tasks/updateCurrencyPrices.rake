namespace :dts do
  desc "Log the db, delete the db, then update the db"
  task :update_currencies_prices => :environment do
    require 'json'
    require 'open-uri'

    #code goes here


    #log the current db:

    #delete the current db:
    Price.destroy_all

    #use the api to update the db:

    url = open("https://openexchangerates.org/api/latest.json?app_id=4810016a8f6e409b8b3d09300c3b8eb2").read
    data = JSON.parse(url)

    data['rates'].each do |json_cp|
      cp = Price.new
      cp.name = json_cp[0]
      cp.price = json_cp[1]

      if json_cp[0] == "BTC"
        lbtcp = LastBtcPrice.new
        lbtcp.price = json_cp[1]
        lbtcp.save
      end

      cp.save
    end

    puts "It works!"
  end

end
