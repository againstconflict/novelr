class Novel < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title
  
  has_many :tags, dependent: :destroy
  has_many :scenes, dependent: :destroy
  has_many :sequels, dependent: :destroy
end