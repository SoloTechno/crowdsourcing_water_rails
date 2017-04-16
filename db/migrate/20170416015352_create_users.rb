class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :first_name
      t.string :last_name
      t.integer :account_type

      t.timestamps
    end
  end
end
