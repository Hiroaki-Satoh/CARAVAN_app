class BlogsController < ApplicationController
  def show
  	@blog = Blog.find(params[:id])
  end

  def index
  	@blogs = Blog.all # 記事を全件習得
  end

  def new
  	@blog = Blog.new
  end

  def create
  	blog = Blog.new(blog_params)
    blog.save
    redirect_to blogs_path(blog_id)
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end

end