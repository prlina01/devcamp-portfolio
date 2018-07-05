class Skill < ApplicationRecord
  validates :title,:percent_utilized, present:true
  # validates :percent_utilized, present:true
end
