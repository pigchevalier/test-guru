class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image
      t.string :rule, null: false
      t.integer :level
      t.references :category,  foreign_key: true
      t.references :test,  foreign_key: true
      t.boolean :first_try

      t.timestamps
    end
  end
end
