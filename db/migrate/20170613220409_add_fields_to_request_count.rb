class AddFieldsToRequestCount < ActiveRecord::Migration
  def change
    add_column :request_groups, :count, :integer
  end
end
