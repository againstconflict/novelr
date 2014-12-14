class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :name
      t.string :description
      t.references :tag, index: true
    end
  end
end
