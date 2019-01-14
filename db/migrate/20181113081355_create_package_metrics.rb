class CreatePackageMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :package_metrics do |t|
      t.references :package
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
