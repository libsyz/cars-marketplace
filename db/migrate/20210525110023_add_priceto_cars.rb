class AddPricetoCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :price_per_hour, :integer
  end
end
