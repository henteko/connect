class BlogsController < ApplicationController
  before_action :render_404, unless: :user_signed_in?
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blog
  # GET /blog.json
  def index
    @blogs = Blog.all
  end

  # GET /blog/1
  # GET /blog/1.json
  def show
  end

  # GET /blog/new
  def new
    @blog = Blog.new
  end

  # GET /blog/1/edit
  def edit
  end

  # POST /blog
  # POST /blog.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
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
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
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
end
