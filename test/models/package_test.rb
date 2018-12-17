# == Schema Information
#
# Table name: packages
#
#  id              :integer          not null, primary key
#  name            :string
#  service_id      :integer
#  price           :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_commercial   :boolean
#  revision_number :integer
#  delivery_time   :integer
#

require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
