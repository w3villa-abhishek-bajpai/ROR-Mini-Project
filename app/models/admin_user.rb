class AdminUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def generate_reset_password_otp!
    update!(
      reset_password_otp: rand(100000..999999).to_s,
      otp_sent_at: Time.current
    )
  end

  def valid_otp?(input_otp)
    reset_password_otp == input_otp && otp_sent_at.present? && otp_sent_at > 10.minutes.ago
  end
  
end
