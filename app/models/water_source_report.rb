# == Schema Information
#
# Table name: water_source_reports
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  reporter_name   :string
#  location        :string
#  lat             :decimal(, )
#  lng             :decimal(, )
#  water_condition :integer
#  water_type      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class WaterSourceReport < ApplicationRecord
	belongs_to :user

	enum water_condition: {
		waste: 0,
		'treatable-clear': 1,
		'treatable-muddy': 2,
		potable: 3
	}

	enum water_type: {
		bottled: 0,
		well: 1,
		stream: 2,
		lake: 3,
		spring: 4,
		other: 5
	}

end
