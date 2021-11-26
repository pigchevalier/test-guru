class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :text
      t.boolean :correct
      t.integer :id_question
      t.integer :id_user

      t.timestamps
    end
  end
end
