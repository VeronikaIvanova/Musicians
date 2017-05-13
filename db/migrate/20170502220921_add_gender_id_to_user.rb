class AddGenderIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender_id, :integer
    add_index :users, :gender_id

    add_foreign_key :users, :genders
  end
end
