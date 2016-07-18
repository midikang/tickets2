class LinksController < ApplicationController
  def index
    @links = Link.all
    @link = Link.new
  end

  def show
  end

  def new
  end

  def create
    @link = Link.new(link_params)
    
    respond_to do |format|
      if @link.save
        format.html {redirect_to @link, notice: "Link was successfully created."}
        format.js # remote
      else
        format.html {render :new}
      end
    end
  end
  
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private 
    def link_params
      params.require(:link).permit(:name, :url)
    end
  
end
