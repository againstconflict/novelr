class AddRankToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :row_order, :integer
  end
end
