class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.string :string
      t.text :description

      t.timestamps
    end
  end
end
