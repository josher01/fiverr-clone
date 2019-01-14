class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, references: :users, foreign_key: true
      t.references :service, references: :services, foreign_key: true

      t.timestamps
    end
  end
end
