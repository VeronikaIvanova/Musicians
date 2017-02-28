class CreateInstrumentalists < ActiveRecord::Migration
  def change
    create_table :instrumentalists do |t|

      t.timestamps null: false
    end
  end
end
