class CreateGroupPurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :group_purchases do |t|
      t.references :group, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
