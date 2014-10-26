class Character < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  belongs_to :novel
  has_many :traits, dependent: :destroy
end
