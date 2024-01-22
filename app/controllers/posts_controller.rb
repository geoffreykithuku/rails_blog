class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    redirect_to root_path

  end

  def create
  end

end
