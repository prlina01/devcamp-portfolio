class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized
  # validates :percent_utilized, present:true
end
