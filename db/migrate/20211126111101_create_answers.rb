class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.boolean :correct, null: false, default: false
      t.references :id_question, null: false, foreign_key: true
      t.references :id_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
