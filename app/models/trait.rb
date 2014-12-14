class Trait < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: :tag_id
  
  belongs_to :tag
end