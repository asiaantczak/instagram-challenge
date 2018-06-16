class PostsController < ApplicationController

  def index
    @posts = Post.all.reverse
  end

  def new
    if current_user
      @post = current_user.posts.create
    else
      flash[:alert] = "You need to sign in or sign up before continuing."
      redirect_to root_path
    end
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Post has been created"
      redirect_to posts_path
    else
      flash[:alert] = "Please attach your image to post"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :description)
  end

end
