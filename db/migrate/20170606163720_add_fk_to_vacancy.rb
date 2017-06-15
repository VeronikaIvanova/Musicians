class AddFkToVacancy < ActiveRecord::Migration
  def change
   add_column :vacancies, :group_id, :integer
   add_foreign_key :vacancies, :groups

   add_column :vacancies, :instrument_id, :integer
   add_foreign_key :vacancies, :instruments
  end
end
