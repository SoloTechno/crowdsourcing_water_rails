# == Schema Information
#
# Table name: water_purity_reports
#
#  id              :integer          not null, primary key
#  reporter_name   :string
#  location        :string
#  lat             :decimal(25, 20)
#  lng             :decimal(25, 20)
#  water_condition :integer
#  virus_ppm       :decimal(, )
#  contaminant_ppm :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class WaterPurityReport < ApplicationRecord
	belongs_to :user

end
