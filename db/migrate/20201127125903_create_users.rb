class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :auth0_uid, null: false
      t.string :subscription_type, default: :basic

      t.timestamps
    end
  end
end
