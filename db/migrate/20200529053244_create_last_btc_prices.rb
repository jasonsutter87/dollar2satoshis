class CreateLastBtcPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :last_btc_prices do |t|
      t.decimal :price

      t.timestamps
    end
  end
end
