class CreateRenterReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :renter_reviews do |t|
      t.text :review
      t.references :car, null: false, foreign_key: true
      t.references :renter, foreign_key: { to_table: :users }
      t.references :reviewer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
