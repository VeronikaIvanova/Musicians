class AddFieldsToAnswer < ActiveRecord::Migration
  def change
   add_column :answers, :vacancy_id, :integer
   add_foreign_key :answers, :vacancies

   add_column :answers, :user_id, :integer
   add_foreign_key :answers, :users
   add_column :answers, :info, :text
  end
end
