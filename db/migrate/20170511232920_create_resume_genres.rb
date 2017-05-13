class CreateResumeGenres < ActiveRecord::Migration
  def change
    create_table :resume_genres do |t|

      t.timestamps null: false
    end
  end
end
