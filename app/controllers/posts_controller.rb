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
    
  end

  def destroy
    
  end
  def update
    
  end

  def post_params
    params.require(:post).permit(:title, :content, :category, :picture)
  end

end
