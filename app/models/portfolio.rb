class Portfolio < ApplicationRecord
  # validates :title, :body, :main_image, :thumb_image, presence:true
  # validates :body, presence:true
  # validates :main_image, presence:true
  # validates :thumb_image, presence:true
  validates_presence_of :title, :body, :main_image, :thumb_image
  def self.angular
    where(title: 'Angular')
  end
  scope :ruby_on_rails_portfolio_items, lambda { where(subtitle: 'Ruby on rails')}
end
