class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :name
      t.string :goal
      t.string :question
      t.string :disaster
      t.string :hanger
      
      t.references :novel, index: true

      t.timestamps
    end
  end
end
