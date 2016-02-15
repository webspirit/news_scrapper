class PagesController < ApplicationController
  def home
  	if current_user
  		redirect_to articles_path
  	end
  end
end
