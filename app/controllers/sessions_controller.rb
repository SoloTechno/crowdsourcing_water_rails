class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render layout: false if request.xhr? || request.env['HTTP_X_CSRF_TOKEN'].present?
  end

  def create
    errors = {}

    if params[:email].empty? || params[:password].empty?
      errors["form-login"] = "Email or password is empty. Please try again."
    end

    user = User.find_by(email: params[:email].downcase)
    if user.present? && user.authenticate(params[:password]) && user.account_type != 'banned'
      log_in user

      if params[:remember_me].present?
        params[:remember_me] == '1' ? remember(user) : forget(user)
      end

      if request.xhr? || request.env['HTTP_X_CSRF_TOKEN'].present?
        render json: { redirect_url: root_path }
      else
        redirect_back_or_to root_path
      end
    # Throws error messages if not authenticated
    else
      if user.account_type == 'banned'
        errors["form-login"] = "The account is banned. Please contact the administrator."
      else
        errors["form-login"] = "Your email or password is not valid. Please try again." 
      end

      if session["incorrect_login_attemps_#{params[:email]}"].nil?
        session["incorrect_login_attemps_#{params[:email]}"] = 1
      elsif session["incorrect_login_attemps_#{params[:email]}"] >= 3
        user.update(account_type: 'banned')
        errors["form-login"] = "The account is banned. Please contact the administrator."
      else
        session["incorrect_login_attemps_#{params[:email]}"] += 1
      end

      if request.xhr? || request.env['HTTP_X_CSRF_TOKEN'].present?
        render json: { errors: errors }, status: :forbidden
      else
        flash[:errors] = errors
        redirect_to login_path
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to params[:redirect_url] || root_path
  end

end