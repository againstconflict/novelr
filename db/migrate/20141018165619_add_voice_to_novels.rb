class AddVoiceToNovels < ActiveRecord::Migration
  def change
    add_column :novels, :voice, :string
  end
end
