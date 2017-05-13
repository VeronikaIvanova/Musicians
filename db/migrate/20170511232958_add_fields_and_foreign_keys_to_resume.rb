class AddFieldsAndForeignKeysToResume < ActiveRecord::Migration
  def change
   add_column :resumes, :information, :string
   add_foreign_key :resumes, :instrumentalists

   add_column :resume_genres, :resume_id, :integer
   add_column :resume_genres, :genre_id, :integer
   add_foreign_key :resume_genres, :resumes
   add_foreign_key :resume_genres, :genres
  end
end
