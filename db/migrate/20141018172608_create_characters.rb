class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.references :novel, index: true

      t.timestamps
    end
  end
end
