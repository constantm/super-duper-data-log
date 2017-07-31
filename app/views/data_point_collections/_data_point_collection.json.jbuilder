json.extract! data_point_collection, :id, :title, :description, :created_at, :updated_at
json.url data_point_collection_url(data_point_collection, format: :json)
