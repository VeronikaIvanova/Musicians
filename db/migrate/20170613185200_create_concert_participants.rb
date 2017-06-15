class CreateConcertParticipants < ActiveRecord::Migration
  def change
    create_table :concert_participants do |t|

      t.timestamps null: false
    end
  end
end
