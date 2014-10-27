class AddSequelToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :scene_text, :string
    add_column :scenes, :emotion, :string
    add_column :scenes, :logic, :string
    add_column :scenes, :decision, :string
    add_column :scenes, :sequel_text, :string
    
  end
end
