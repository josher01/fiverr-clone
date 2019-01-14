class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :comment
      t.references :user, references: :users
      t.references :service, references: :services

      t.timestamps
    end
  end
end
