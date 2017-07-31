class CreateDataPointCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :data_point_collections do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
