class Novel < ActiveRecord::Base
  validates_uniqueness_of :title
  
  has_many :characters, dependent: :destroy
  has_many :scenes, dependent: :destroy
end