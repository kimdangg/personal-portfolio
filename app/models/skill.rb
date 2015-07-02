class Skill < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  validates :name, :presence => true
  validates :description, :presence => true
end
