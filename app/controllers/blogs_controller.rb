class BlogsController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumb_to_blogs_path

  # GET /:username
  # GET /:username.json
  def index
    user = User.find_by_username(params[:username])
    @blogs = Blog.where(user: user).page(params[:page])
  end

  # GET /:username/:id
  # GET /:username/:id.json
  def show
    add_breadcrumb @blog.title, @blog.path
  end

  # GET /blog/new
  def new
    @blog = Blog.new
    add_breadcrumb 'New entry', "/#{current_user.username}/new"
  end

  # GET /blog/1/edit
  def edit
    add_breadcrumb @blog.title, @blog.path
    add_breadcrumb 'Edit entry', @blog.edit_path
  end

  # POST /blog
  # POST /blog.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog.path,
                      notice: 'Blog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/1
  # PATCH/PUT /blog/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog.path,
                      notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog/1
  # DELETE /blog/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  # GET /:username/:id/history
  def history
    user = User.find_by_username(params[:username])
    @blog = Blog.find_by(id: params[:id], user: user)
    add_breadcrumb @blog.title, @blog.path
    add_breadcrumb 'Entry history', @blog.history_path
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
    add_breadcrumb "#{params[:username]} blog", "/#{params[:username]}"
  end
end
