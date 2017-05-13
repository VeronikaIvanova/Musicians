class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :instrumentalist_id

      t.timestamps null: false
    end
  end
end
