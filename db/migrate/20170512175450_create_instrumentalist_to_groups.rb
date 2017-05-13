class CreateInstrumentalistToGroups < ActiveRecord::Migration
  def change
    create_table :instrumentalist_to_groups do |t|

      t.timestamps null: false
    end
  end
end
