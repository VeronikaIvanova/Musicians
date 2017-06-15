class CreateConcertFollowers < ActiveRecord::Migration
  def change
    create_table :concert_followers do |t|

      t.timestamps null: false
    end
  end
end
