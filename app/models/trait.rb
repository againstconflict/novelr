class Trait < ActiveRecord::Base
  validates_uniqueness_of :name
  
  belongs_to :character
end