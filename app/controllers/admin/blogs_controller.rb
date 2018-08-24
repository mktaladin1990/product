class Admin::BlogsController < ApplicationController
  def index
    @blog = Blog.all
  end
  def new
    @blog = Blog.new
      authorize([:admin,@blog])
  end
  def edit

    @blog  = Blog.find_by_id(params[:id])
    authorize([:admin,@blog])
  end
  def create
    @blog = Blog.new(blog_params)
    authorize([:admin,@blog])
     @blog.save

  end
  def update
    @blog = Blog.find_by_id(params[:id])
        authorize([:admin,@blog])
  end
  def detroy
      @blog = Blog.find_by_id(params[:id])
      @blog.destroy
        authorize @blog
      redirect_to admin_users_path
  end
  def show
    @blog = Blog.find_by_id(params[:id])
  end
  private
    def blog_params
        params.require(:blog).permit :title, :content, :image
    end

end
