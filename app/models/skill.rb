class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized
  # validates :percent_utilized, present:true
    after_initialize :set_defaults

  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '250') 
    # ||= -> ako je self.badge = nil uradi ...
  end

end
