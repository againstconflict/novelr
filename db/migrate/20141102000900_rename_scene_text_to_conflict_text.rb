class RenameSceneTextToConflictText < ActiveRecord::Migration
  def change
    rename_column :scenes, :scene_text, :conflict_text
  end
end
