class AddTextToSequels < ActiveRecord::Migration
  def change
    add_column :sequels, :text, :string
  end
end
