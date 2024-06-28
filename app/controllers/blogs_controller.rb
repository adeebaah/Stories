class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  def show

  end
  def new
    @blog = current_user.blogs.build
  end

  def edit

  end
  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # code here
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def correct_user
    @blog = current_user.blogs.find_by(id: params[:id])
    redirect_to blogs_path, notice: "Not authorized to edit this blog" if @blog.nil?
  end
end
