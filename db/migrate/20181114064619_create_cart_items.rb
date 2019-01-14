class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, references: :carts
      t.references :package, references: :packages
      t.integer :quantity

      t.timestamps
    end
  end
end
