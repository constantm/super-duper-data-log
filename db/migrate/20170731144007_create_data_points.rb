class CreateDataPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :data_points do |t|
      t.integer :data_point_collection_id
      t.float :value

      t.timestamps
    end
  end
end
