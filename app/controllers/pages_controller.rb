class PagesController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :set_page, only: [:update, :destroy]
  before_action :add_breadcrumb_to_pages_path

  # GET /pages
  def index
    @pages = Page.page(params[:page])
  end

  # GET /pages/:page_names
  # GET /pages/:page_names.json
  def show
    @page = Page.find_by_page_names(params[:page_names])
    Page.where_page_names(params[:page_names]).each do |page|
      add_breadcrumb page.title, page.path
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
    add_breadcrumb 'Create page', new_page_path
  end

  # GET /pages/:page_names/edit
  def edit
    @page = Page.find_by_page_names(params[:page_names])
    Page.where_page_names(params[:page_names]).each do |page|
      add_breadcrumb page.title, page.path
    end
    add_breadcrumb 'Editing page', @page.edit_path
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to "/pages/#{@page.page_name}",
                      notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to "/pages/#{@page.page_name}",
                      notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_path }
      format.json { head :no_content }
    end
  end

  # GET /pages/:page_names/history
  def history
    @page = Page.find_by_page_names(params[:page_names])
    Page.where_page_names(params[:page_names]).each do |page|
      add_breadcrumb page.title, page.path
    end
    add_breadcrumb 'Page history', @page.history_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    page = params.require(:page).permit(:raw_title, :raw_body, :page_name, :parent_page_id)
    page[:user_id] = current_user.id
    page
  end

  def add_breadcrumb_to_pages_path
    add_breadcrumb 'pages', pages_path
  end
end
