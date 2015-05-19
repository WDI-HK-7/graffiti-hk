class LikesController < ApplicationController
  def index
    @likes = Like.order(:created_at)
    # render :json => @likes
  end
  def create
    @likes = Like.new(likes_params)
  end

  private 
  def likes_params
    
  end
end
