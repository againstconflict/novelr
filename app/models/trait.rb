class Trait < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :character_id
  
  belongs_to :character
end