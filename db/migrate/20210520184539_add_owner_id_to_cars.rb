class AddOwnerIdToCars < ActiveRecord::Migration[6.1]
  def change
    add_reference :cars, :owner, null: true, foreign_key: { to_table: :users }
  end
end
