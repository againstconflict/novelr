class Scene < ActiveRecord::Base
  include RankedModel
  
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :novel_id
  
  belongs_to :novel
  
  ranks :row_order
end
