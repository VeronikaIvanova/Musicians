class AddColumnsToInstrumentalist < ActiveRecord::Migration
  def change


    add_column :instrumentalists, :user_id, :integer
    add_index :instrumentalists, :user_id

    add_column :instrumentalists, :instrument_id, :integer
    add_index :instrumentalists, :instrument_id

    add_foreign_key :instrumentalists, :users
    add_foreign_key :instrumentalists, :instruments

  end
end
