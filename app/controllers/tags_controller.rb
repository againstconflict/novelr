class TagsController < ApplicationController
  http_basic_authenticate_with name: "alex", password: "jackjack"
  
  def index
    @novel = Novel.find(params[:novel_id])
    @tags = @novel.tags
  end
  
  def new
    @novel = Novel.find(params[:novel_id])
    @tag = @novel.tags.new
  end
  
  def create
    @novel = Novel.find(params[:novel_id])
    @tag = @novel.tags.create(tag_params)
    
    if @tag.save
      redirect_to novel_path(@novel.id)
    else
      render 'new'
    end
  end
  
  def show
    @novel = Novel.find(params[:novel_id])
    @tag = @novel.tags.find(params[:id])
  end
  
  def edit
    @novel = Novel.find(params[:novel_id])
    @tag = @novel.tags.find(params[:id])
  end
  
  def update
    @novel = Novel.find(params[:novel_id])
    @tag = @novel.tags.find(params[:id])
    
    if @tag.update(tag_params)
      redirect_to novel_tags_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @novel = Novel.find(params[:novel_id])
    @tag = @novel.tags.find(params[:id])
    @tag.destroy
    
    redirect_to novel_path(params[:novel_id])
  end
  
  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end