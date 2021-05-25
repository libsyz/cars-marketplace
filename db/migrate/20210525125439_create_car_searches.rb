class CreateCarSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :car_searches do |t|

      t.timestamps
    end
  end
end
