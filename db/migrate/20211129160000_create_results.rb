class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests, table_name: :results do |t|
      t.index :user_id
      t.index :test_id
    end
  end
end
