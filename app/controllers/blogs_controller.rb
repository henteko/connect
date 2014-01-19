class BlogsController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumb_to_blogs_path

  # GET /:username/blogs
  def index
    @blogs = User.find_by_username(params[:username]).blogs.page(params[:page])
  end

  # GET /:username/blogs/1
  def show
    add_breadcrumb @blog.title.html_safe, blog_path(@blog, username: @blog.username)
  end

  # GET /:username/blogs/new
  def new
    @blog = Blog.new
    add_breadcrumb t('.new_entry'), new_blog_path
  end

  # GET /:username/blogs/1/edit
  def edit
    authorize! :edit, @blog
    add_breadcrumb @blog.title.html_safe, blog_path(@blog, username: @blog.username)
    add_breadcrumb t('.editing_entry'), edit_blog_path(@blog, username: @blog.username)
  end

  # POST /:username/blogs
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog, username: @blog.username),
                      notice: t('.entry_was_successfully_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /:username/blogs/1
  def update
    authorize! :update, @blog
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog, username: @blog.username),
                      notice: t('.entry_was_successfully_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /:username/blogs/1
  def destroy
    authorize! :destroy, @blog
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url }
    end
  end

  # GET /:username/blogs/1/history
  def history
    user = User.find_by_username(params[:username])
    @blog = Blog.find_by(id: params[:id], user: user)
    add_breadcrumb @blog.title.html_safe, blog_path(@blog, username: @blog.username)
    add_breadcrumb t('.history'), history_blog_path(@blog, username: @blog.username)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    blog = params.require(:blog).permit(:raw_title, :raw_body)
    blog[:user_id] = current_user.id
    blog
  end

  def add_breadcrumb_to_blogs_path
    add_breadcrumb t('entry_list'), blogs_path
  end
end
