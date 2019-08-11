class ActivityCategory < ApplicationRecord
  has_many :activities
  validates_presence_of :name
end
