class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :email, null: false, unique: true
      t.boolean :access_admin
      
      t.timestamps
    end
  end
end
