class HomeController < ApplicationController
  skip_before_action :require_login, only: [:top]
  def top
    
  end
  def message
    @groups=Group.all
    @members=Member.all
  end
  def search
    session[:search_commit] = nil
    session[:search_keyword] = nil
    session[:search_classification] = nil
    session[:search_hash_tag] = nil
  end  
end
