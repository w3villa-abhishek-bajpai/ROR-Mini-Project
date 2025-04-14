# app/controllers/admin/passwords_controller.rb
class Admin::PasswordController < Devise::PasswordsController
  def create
    self.resource = AdminUser.find_by(email: params[:admin_user][:email])

    if resource.present?
      # Generate OTP and timestamp
      otp_code = rand(100000..999999).to_s
      resource.update(
        reset_password_otp: otp_code,
        otp_sent_at: Time.current
      )

      # Send OTP via mailer
      OtpMailer.send_otp(resource).deliver_now

      # Store email in session to identify user in OTP step
      session[:reset_email] = resource.email

      # Redirect to OTP verification page
      redirect_to new_admin_otp_verification_path, notice: "OTP sent to your email."
    else
      flash.now[:alert] = "Email not found"
      render :new
    end
  end
end
