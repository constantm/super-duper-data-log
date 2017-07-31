class DataPoint < ApplicationRecord
  belongs_to :data_point_collection
  validates :value, presence: true
end
