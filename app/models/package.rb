class Package < ApplicationRecord
  belongs_to :service
  has_many :package_metrics
end
