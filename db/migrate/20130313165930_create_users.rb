class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.integer :token
      t.datetime :token_expiration

      t.timestamps
    end
  end
end
