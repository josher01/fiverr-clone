class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, references: :users
      t.references :service, references: :services

      t.timestamps
    end
  end
end
