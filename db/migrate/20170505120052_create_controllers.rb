class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :Instruments

      t.timestamps null: false
    end
  end
end
