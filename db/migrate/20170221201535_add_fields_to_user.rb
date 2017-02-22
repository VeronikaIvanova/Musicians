class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string   
    add_column :users, :date_of_birth, :datetime 
    add_column :users, :info, :text 
  end
end
