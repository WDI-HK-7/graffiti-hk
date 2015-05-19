class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at)
    render :json => @posts
  end

  def create
    @post =Post.new(post_params)
    if @post.save
      render :json => {message: "saved"}
    else
      render :json => {message: "not saved"}
    end
  end

  def show
    @post = Post.find_by_id(params[:id])

    if @post.nil?
      render :json => {
        message: "Cannot find post with id=#{params[:id]}"
      }
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.nil?
      render :json => {
        message: "Cannot find post with id=#{params[:id]}"
      }
    else
      if @post.destroy
        render :json => { message: "deleted"}
      else 
        render :json => { message: "not deleted"}
      end
    end
  end

  def update
    
  end

  def post_params
    params.require(:post).permit(:artist, :caption, :address, :picture)
  end

end
