class AddFieldsToResponse < ActiveRecord::Migration
  def change
   add_column :responses, :vacancy_id, :integer
   add_foreign_key :responses, :vacancies

   add_column :responses, :user_id, :integer
   add_foreign_key :responses, :users
   add_column :responses, :info, :text
  end
end
