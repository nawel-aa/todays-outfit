class AddIdToWorn < ActiveRecord::Migration[6.0]
  def change
    add_column :worn, :id, :primary_key
  end
end
