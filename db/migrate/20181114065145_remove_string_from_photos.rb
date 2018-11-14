class RemoveStringFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :string, :string
  end
end
