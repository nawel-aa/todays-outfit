class CreateWorns < ActiveRecord::Migration[6.0]
  def change
    create_join_table :items, :outfits, table_name: :worn do |t|
      t.boolean :rejected, default: false
      t.timestamps
    end
  end
end
