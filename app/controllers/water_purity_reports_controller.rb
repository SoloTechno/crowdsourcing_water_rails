class WaterPurityReportsController < ApplicationController
	before_action :logged_in_user, except: [:index, :show]
	before_action :set_user, except: [:index, :show]
	before_action :correct_user, except: [:index, :show]
	before_action :set_water_purity_report_from_user, only: [:new]
	before_action :set_user, except: [:index, :show]

	def index
	end

	def create
	end

	def new
	end

	def edit
	end

	def show
	end
	
	def update
	end

	def destroy
	end

	private

	def correct_user
      redirect_to root_url unless current_user?(@user)
    end

	def set_water_purity_report_from_user
		@water_purity_report = WaterPurityReport.create(user_id: @user.id)
	end

	def set_user
    @user = current_user
  end
end