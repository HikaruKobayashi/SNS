class V1::BlogsController < ApplicationController
  def index
    blog = Blog.all.order(created_at: :desc)
    render json: blog
  end

  def show
    @blog = User.find(params[:id])
    if @blog
      render json: @blog
    end
  end

  def create
    current_user = User.find(params[:current_user_id])
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      @blog.eyecatch = blog_params[:image]
      render json: { blog: @blog.to_json(methods: :image) }
    else
      puts "Error!Can not upload image."
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :link, :image, :user_id)
  end
end
