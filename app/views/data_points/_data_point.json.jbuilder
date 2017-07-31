json.extract! data_point, :id, :data_point_collection_id, :value, :created_at, :updated_at
json.url data_point_url(data_point, format: :json)
