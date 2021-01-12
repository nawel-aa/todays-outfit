class CreateCategoriesOutfitsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :outfits do |t|
      # t.index [:category_id, :outfit_id]
      # t.index [:outfit_id, :category_id]
    end
  end
end
