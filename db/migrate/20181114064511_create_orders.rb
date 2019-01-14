class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, references: :users
      t.integer :price
      t.integer :quantity
      t.string :shipping_status
      t.string :integer
      t.integer :payment_status
      t.string :username
      t.integer :amount
      t.string :address
      t.string :phone
      t.integer :sn

      t.timestamps
    end
  end
end
