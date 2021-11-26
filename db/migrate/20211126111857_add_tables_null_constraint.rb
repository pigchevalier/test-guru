class AddTablesNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:questions, :text, false)
    change_column_null(:questions, :answer, false)
    change_column_null(:answers, :text, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :id_question, false)
    change_column_null(:answers, :id_user, false)
    change_column_null(:users, :name, false)
    change_column_null(:users, :access_admin, false)
    change_column_null(:categories, :title, false)
  end
end
