class CreateContributions < ActiveRecord::Migration[7.1]
  def change
    create_table :contributions do |t|
      t.references :project, null: false, foreign_key: true
      t.decimal :amount
      t.string :user_email
      t.string :payment_status

      t.timestamps
    end
  end
end
