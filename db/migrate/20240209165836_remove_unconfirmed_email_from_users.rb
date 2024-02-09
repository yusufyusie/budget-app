class RemoveUnconfirmedEmailFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :unconfirmed_email, :string
  end
end
