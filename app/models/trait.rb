class Trait < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: :character_id
  
  belongs_to :character
end