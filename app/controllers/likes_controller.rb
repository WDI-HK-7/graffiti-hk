class LikesController < ApplicationController
  before_action :authenticate_user!
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

  def update 
    @like = Like.find_by_id(params[:id])
    if @like.nil? 
      render :json => {
        message: "Cannot find like with id #{params[:id]}"
      }
    else
      if current_user == @like.user
        if @like.update(likes_params)
          render :json => { message: "updated"}
        else
          render :json => { message: "not updated"}
        end
      end
    end
  end

  def destroy
    @like = Like.find_by_id(params[:id])
    if @like.nil? 
      render :json => {
        message: "Cannot find like with id #{params[:id]}"
      }
    else
      if @like.destroy
        render :json => { message: "deleted"}
      else
        render :json => { message: "not deleted"}
      end
    end
  end

  private 
  def likes_params
    params.require(:like).permit(:rating, :post_id,:user_id)
  end

end
