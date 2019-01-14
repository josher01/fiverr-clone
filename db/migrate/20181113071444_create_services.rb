class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :user, references: :users
      t.references :category, references: :categories
      t.string :title
      t.text :description
      t.integer :favorites_count, default: 0

      t.timestamps
    end
  end
end
