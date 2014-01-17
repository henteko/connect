class LinksController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :set_link, only: [:edit, :update, :destroy]
  before_action :add_breadcrumb_to_links_path

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/new
  def new
    @link = Link.new
    add_breadcrumb t('.creating_link'), new_link_path
  end

  # GET /links/1/edit
  def edit
    add_breadcrumb t('.editing_link'), edit_link_path(@link)
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_path,
                      notice: t('.link_was_successfully_created') }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to links_path,
                      notice: t('.link_was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:title, :url)
  end

  def add_breadcrumb_to_links_path
    add_breadcrumb t('link_list'), links_path
  end
end
