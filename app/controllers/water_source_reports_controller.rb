class WaterSourceReportsController < ApplicationController
	before_action :logged_in_user, except: [:index, :show]
	before_action :set_user, except: [:index, :show]
	before_action :create_water_source_report, only: [:new]
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
	end
	
	def update
		@water_source_report = WaterSourceReport.find(params[:id])
		if @water_source_report.update(water_source_reports_params)
			redirect_to water_reports_path
		end
	end

	def destroy
	end

	private

		def correct_user
      redirect_to root_url unless current_user?(@user)
    end

		def create_water_source_report
			@water_source_report = WaterSourceReport.create(user_id: @user.id)
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

	  def water_source_reports_params
	  	params.require(:water_source_report).permit(
	  		:location, :lat, :lng, :reporter_name,
	  		:water_type, :water_condition,
  		)
	  end

end