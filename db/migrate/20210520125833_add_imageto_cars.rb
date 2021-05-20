class AddImagetoCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :image_urls, :text
  end
end
