class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comment = Comment.where(post_id: params[:post_id]).order(:created_at)
  end

  def create
    # @comment = current_user.comments.new(comment_params)
    @comment = Post.find(params[:post_id]).comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render :json => {
        :message => { :message => "Successful", :saved => true, :comment => @comment}
      }
    else
      render :json => {
        :message => { :message => "Unsuccessful", :saved => false}
      }
    end
  end

  def update 
    @comment = Comment.find_by_id(params[:id])
    if @comment.nil? 
      render :json => {
        message: "Cannot find comment with id #{params[:id]}"
      }
    else
      # if current_user == @comment.user
        if @comment.update(comment_params)
          render :json => { message: "updated"}
        else
          render :json => { message: "not updated"}
        end
      # end
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    if @comment.nil? 
      render :json => {
        message: "Cannot find comment with id #{params[:id]}"
      }
    else
      if @comment.destroy
        render :json => { message: "deleted"}
      else
        render :json => { message: "not deleted"}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
