class LikesController < ApplicationController
  def index
    @likes = Like.order(:created_at)
    # render :json => @likes
  end

  def create
    @like = Like.new(likes_params)
    if @like.save
      render :json => { message: "saved"}
    else
      render :json => { message: "not saved"}
    end
  end

  private 
  def likes_params
    params.require(:like).permit(:rating, :post_id)
  end

end
