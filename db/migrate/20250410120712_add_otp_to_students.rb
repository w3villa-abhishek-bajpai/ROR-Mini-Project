class AddOtpToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :otp, :string
    add_column :students, :otp_sent_at, :datetime
  end
end
