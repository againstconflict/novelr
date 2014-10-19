class CreateSequels < ActiveRecord::Migration
  def change
    create_table :sequels do |t|
      t.string :name
      t.string :emotion
      t.string :logic
      t.string :decision
      
      t.references :novel, index: true

      t.timestamps
    end
  end
end
