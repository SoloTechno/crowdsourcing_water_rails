class WaterPurityReportsController < ApplicationController
	before_action :logged_in_user, except: [:index, :show]
	before_action :set_user, except: [:index, :show]
	before_action :create_water_purity_report, only: [:new]
	before_action :correct_user, except: [:index, :show]
	before_action :check_user_name, only: [:new]

	# shows both water source/purity reports
	def index
		respond_to do |format|
			format.html { render :index }

			# on AJAX map request
			format.json {
				render json: User.get_map_data
			}
		end
	end

	def create
	end
 	
	def new
	end

	def edit
	end

	def show
		@water_purity_report = WaterPurityReport.find(params[:id])
	end
	
	def update
		@water_purity_report = WaterPurityReport.find(params[:id])
		if @water_purity_report.update(water_purity_reports_params)
			redirect_to water_reports_path
		end
	end

	def destroy
		@water_purity_report = WaterPurityReport.find(params[:id])
		@water_purity_report.destroy

		redirect_to water_reports_path
	end

	private

		def correct_user
      redirect_to root_url unless current_user?(@user)
    end

		def create_water_purity_report
			@water_purity_report = WaterPurityReport.create(user_id: @user.id)
		end

		def set_user
			@user = current_user
	  end

	  def check_user_name
	  	if @user.first_name.blank? || @user.last_name.blank?
	  		msg = "Please type in the first/last name to submit a water report."
	      redirect_to edit_user_path(@user.id), flash: { error: msg }
	    end
	  end

	  def water_purity_reports_params
	  	params.require(:water_purity_report).permit(
	  		:location, :lat, :lng, :reporter_name,
	  		:water_condition, :virus_ppm, :contaminant_ppm,
  		)
	  end

end