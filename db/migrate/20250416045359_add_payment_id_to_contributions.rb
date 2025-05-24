class AddPaymentIdToContributions < ActiveRecord::Migration[7.1]
  def change
    add_column :contributions, :payment_id, :string
  end
end
