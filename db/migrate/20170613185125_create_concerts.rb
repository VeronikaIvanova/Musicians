class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :name
      t.string :place
      t.datetime :date
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
