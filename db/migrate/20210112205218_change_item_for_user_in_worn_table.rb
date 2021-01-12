class ChangeItemForUserInWornTable < ActiveRecord::Migration[6.0]
  def change
    change_table :worn do |t|
      t.remove :item_id
      t.references :user
    end
  end
end
