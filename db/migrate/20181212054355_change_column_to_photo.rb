class ChangeColumnToPhoto < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :imageable_id, :integer
    remove_column :photos, :imageable_type, :string
    add_reference :photos, :service, references: :services, index: true
  end
end
