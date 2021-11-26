class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.string :answer, null: false
      t.references :id_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
