class AddPriceAndShortDescriptionToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :price, :decimal
    add_column :products, :short_description, :string
  end
end
