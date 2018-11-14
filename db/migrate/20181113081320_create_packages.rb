class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.references :service, foreign_key: true
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
