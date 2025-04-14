class AddOtpToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :otp, :string
    add_column :admin_users, :otp_sent_at, :datetime
  end
end
