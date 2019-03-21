class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    session[:user_name] = 'Proweb'
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
  end

  def edit
  end

  def update
   if @post.update(post_params)
      redirect_to posts_path, success: " Mise à jour éffectuée avec success"
   else
     render 'posts/edit'
   end

  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: " Suppression éffectuée avec success"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
