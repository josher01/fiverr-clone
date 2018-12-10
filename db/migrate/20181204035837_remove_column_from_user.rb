class RemoveColumnFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :profiles, :user, index: true
  end
end
