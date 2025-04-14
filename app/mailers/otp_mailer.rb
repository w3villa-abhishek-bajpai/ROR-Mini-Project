class OtpMailer < ApplicationMailer
    def send_otp(admin_user)
      @otp = admin_user.reset_password_otp
      @user_name = admin_user.email.split('@').first  # Optionally extract name from email
      mail(to: admin_user.email, subject: "Your OTP for Password Reset")
    end
  end
  