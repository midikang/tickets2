class BlogContentsController < ApplicationController
  before_action :set_blog_content, only: [:show, :edit, :update, :destroy]

  # GET /blog_contents
  # GET /blog_contents.json
  def index
    @blog_contents = BlogContent.all
  end

  # GET /blog_contents/1
  # GET /blog_contents/1.json
  def show
  end

  # GET /blog_contents/new
  def new
    @blog_content = BlogContent.new
  end

  # GET /blog_contents/1/edit
  def edit
  end

  # POST /blog_contents
  # POST /blog_contents.json
  def create
    @blog_content = BlogContent.new(blog_content_params)

    respond_to do |format|
      if @blog_content.save
        format.html { redirect_to @blog_content, notice: 'Blog content was successfully created.' }
        format.json { render :show, status: :created, location: @blog_content }
      else
        format.html { render :new }
        format.json { render json: @blog_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_contents/1
  # PATCH/PUT /blog_contents/1.json
  def update
    respond_to do |format|
      if @blog_content.update(blog_content_params)
        format.html { redirect_to @blog_content, notice: 'Blog content was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_content }
      else
        format.html { render :edit }
        format.json { render json: @blog_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_contents/1
  # DELETE /blog_contents/1.json
  def destroy
    @blog_content.destroy
    respond_to do |format|
      format.html { redirect_to blog_contents_url, notice: 'Blog content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_content
      @blog_content = BlogContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_content_params
      params.require(:blog_content).permit(:content, :blog_id)
    end
end
