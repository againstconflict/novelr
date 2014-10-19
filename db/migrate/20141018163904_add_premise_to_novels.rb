class AddPremiseToNovels < ActiveRecord::Migration
  def change
    add_column :novels, :premise, :string
  end
end
