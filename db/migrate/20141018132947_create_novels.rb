class CreateNovels < ActiveRecord::Migration
  def change
    create_table :novels do |t|
      t.string :title
      t.text :text
      
      t.timestamps
    end
  end
end
