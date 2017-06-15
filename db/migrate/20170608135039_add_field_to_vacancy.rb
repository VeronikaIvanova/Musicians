class AddFieldToVacancy < ActiveRecord::Migration
  def change
   add_column :vacancies, :info, :text
  end
end
