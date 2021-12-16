class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image
      t.integer :rule, null: false
      t.string :parameter

      t.timestamps
    end
  end
end
