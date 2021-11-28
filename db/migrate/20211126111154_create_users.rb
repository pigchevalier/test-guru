class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password
      t.boolean :access_admin, null: false
      
      t.timestamps
    end
  end
end
