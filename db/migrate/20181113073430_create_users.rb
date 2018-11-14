class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.integer :uid
      t.text :description

      t.timestamps
    end
  end
end
