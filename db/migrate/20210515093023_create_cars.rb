class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :license_plate
      t.integer :age
      t.string :model
      t.string :brand
      t.string :pickup_location
      t.string :rental_instructions

      t.timestamps
    end
  end
end
