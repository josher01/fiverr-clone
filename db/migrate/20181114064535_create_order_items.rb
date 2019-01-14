class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :package, references: :packages, foreign_key: true
      t.references :order, references: :orders, foreign_key: true
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
