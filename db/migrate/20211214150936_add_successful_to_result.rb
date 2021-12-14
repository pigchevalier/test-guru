class AddSuccessfulToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :successful, :boolean, default: false
  end
end
