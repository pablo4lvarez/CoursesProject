class HomeController < ApplicationController
  def index
    @courses = Course.all
    if params[:search_key]      
      @courses = Course.where("name LIKE ? OR description LIKE ?", "%#{params[:search_key]}%", 
                              "%#{params[:search_key]}%")
    else
      @courses = Course.all
    end
  end   
end