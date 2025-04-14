class AddResetPasswordOtpToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :reset_password_otp, :string
  end
end
