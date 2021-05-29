class AddPriceToCars < ActiveRecord::Migration[6.1]
  def change
    add_monetize :cars, :price, currency: { present: false }
    remove_column :cars, :price_per_hour, :integer
  end
end
