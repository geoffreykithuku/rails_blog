class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :about]

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :get_current_user
  def new
    @post = Post.new
  end

  def index
    @posts = user_signed_in? ? Post.sorted : Post.published.sorted
    @pagy, @posts = pagy(@posts)
  end

  def show

  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @post.user.email != current_user.email
      redirect_to @post, status: :forbidden, notice: "You can't edit this post"
      return
    end

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.user.email != current_user
      redirect_to @post, notice: "You can't delete this post", status: :forbidden
      return
    end

    @post.destroy
    redirect_to root_path
  end

  def about
    render :about
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published_at, :cover_image)
  end

  def set_post
    @post = user_signed_in? ? Post.find(params[:id]) : Post.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def get_current_user
    if current_user
      @current_user = current_user
    else
      @current_user = nil
    end
  end
end
