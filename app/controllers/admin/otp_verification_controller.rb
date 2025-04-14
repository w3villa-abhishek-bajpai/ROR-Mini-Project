class Admin::OtpVerificationController < ApplicationController
    def new
    end
  
    def create
      user = AdminUser.find_by(email: session[:reset_email])
  
      if user && user.valid_otp?(params[:otp])
        session[:otp_verified] = true
        redirect_to edit_admin_user_password_path(reset_password_token: user.send_reset_password_instructions)
      else
        flash.now[:alert] = "Invalid or expired OTP"
        render :new
      end
    end
  end 