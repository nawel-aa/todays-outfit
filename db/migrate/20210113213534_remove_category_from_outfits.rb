class RemoveCategoryFromOutfits < ActiveRecord::Migration[6.0]
  def change
    remove_column :outfits, :category, :string
  end
end
