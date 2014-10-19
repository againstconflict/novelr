class AddTextToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :text, :string
  end
end
