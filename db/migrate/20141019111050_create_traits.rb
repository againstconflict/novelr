class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :name
      t.string :description
      t.references :character, index: true
    end
  end
end
