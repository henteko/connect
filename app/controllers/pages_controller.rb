class PagesController < ApplicationController
  before_action :redirect_to_sign_in, unless: :user_signed_in?
  before_action :set_page, only: [:update, :destroy]

  # GET /page/:url
  # GET /page/:url.json
  def show
    @page = Page.find_by_url(params[:url])
    return redirect_to "/page/#{params[:url]}/edit" unless @page
  end

  # GET /page/new
  def new
    @page = Page.new
  end

  # GET /page/:url/edit
  def edit
    @page = Page.find_by_url(params[:url]) || Page.new(url: params[:url])
  end

  # POST /page
  # POST /page.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to "/page/#{@page.url}",
                      notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page/1
  # PATCH/PUT /page/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to "/page/#{@page.url}",
                      notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page/1
  # DELETE /page/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  # GET /page/:url/history
  def history
    @page = Page.find_by_url(params[:url])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    page = params.require(:page).permit(:raw_title, :raw_body, :url)
    page[:user_id] = current_user.id
    page
  end
end
