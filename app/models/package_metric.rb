# == Schema Information
#
# Table name: package_metrics
#
#  id          :integer          not null, primary key
#  package_id  :integer
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PackageMetric < ApplicationRecord
  belongs_to :package
end
