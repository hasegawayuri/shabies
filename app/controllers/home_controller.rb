class HomeController < ApplicationController
  skip_before_action :require_login, only: [:top]
  def top
    
  end
  def message
  end  
end
