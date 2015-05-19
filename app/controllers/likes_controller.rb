class LikesController < ApplicationController
  def index
    @likes = Like.order(:created_at)
    render :json => @likes
  end
end
