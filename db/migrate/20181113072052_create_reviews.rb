class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :comment
      t.references :user, references: :users, foreign_key: true
      t.references :service, references: :services, foreign_key: true

      t.timestamps
    end
  end
end
