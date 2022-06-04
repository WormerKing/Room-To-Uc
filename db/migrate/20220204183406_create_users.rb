class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username,null: false
      t.string :first_name,null: false
      t.string :last_name,null: false
      t.string :email,null: false
      t.string :password_digest
      t.string :role,null: false
      t.string :pubg_id,null: false

      t.timestamps
    end
    add_index :users,:username,unique:true
  end
end
