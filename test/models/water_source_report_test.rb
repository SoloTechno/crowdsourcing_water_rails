# == Schema Information
#
# Table name: water_source_reports
#
#  id              :integer          not null, primary key
#  reporter_name   :string
#  location        :string
#  lat             :decimal(, )
#  lng             :decimal(, )
#  water_condition :integer
#  water_type      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class WaterSourceReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
