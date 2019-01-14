class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :seller, foreign_key: {to_table: :users}
      t.references :category, foreign_key: true
      t.string :title
      t.text :description
      t.integer :favorites_count, default: 0

      t.timestamps
    end
  end
end
