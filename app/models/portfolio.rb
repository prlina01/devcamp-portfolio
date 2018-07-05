class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence:true
  # validates :body, presence:true
  # validates :main_image, presence:true
  # validates :thumb_image, presence:true
end
