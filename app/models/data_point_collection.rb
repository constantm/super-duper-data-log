class DataPointCollection < ApplicationRecord
  has_many :data_points

  def latest_value
    data_points.try(:last).try(:value) || 'N/A'
  end
end
