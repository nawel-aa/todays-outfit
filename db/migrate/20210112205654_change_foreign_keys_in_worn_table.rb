class ChangeForeignKeysInWornTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :worn, :user_id, false
    add_foreign_key :worn, :outfits
    add_foreign_key :worn, :users
  end
end
