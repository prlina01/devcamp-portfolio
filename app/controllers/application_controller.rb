class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = DevcampViewTool::Renderer.copyright 'Petar Prlina', 'All rights reserved'
  end
end

module DevcampViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; <b>#{name}</b> #{Time.now.year} | #{msg} ".html_safe
    end
  end
end 
