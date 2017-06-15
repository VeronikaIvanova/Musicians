class CreateConcertNotes < ActiveRecord::Migration
  def change
    create_table :concert_notes do |t|

      t.timestamps null: false
    end
  end
end
