class ScenesController < ApplicationController
  http_basic_authenticate_with name: "alex", password: "jackjack"
  
  def index
    @novel = Novel.find(params[:novel_id])
    @scenes = @novel.scenes
  end
  
  def new
    @novel = Novel.find(params[:novel_id])
    @scene = @novel.scenes.new
  end
  
  def create
    @novel = Novel.find(params[:novel_id])
    @scene = @novel.scenes.create(scene_params)
    
    if @scene.save
      redirect_to novel_scenes_path
    else
      render 'new'
    end
  end
  
  def show
    @novel = Novel.find(params[:novel_id])
    @scene = @novel.scenes.find(params[:id])
  end
  
  def edit
    @novel = Novel.find(params[:novel_id])
    @scene = @novel.scenes.find(params[:id])
  end
  
  def update
    @novel = Novel.find(params[:novel_id])
    @scene = @novel.scenes.find(params[:id])
    
    if @scene.update(scene_params)
      redirect_to novel_scenes_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @novel = Novel.find(params[:novel_id])
    @scene = @novel.scenes.find(params[:id])
    @scene.destroy
    
    redirect_to novel_scenes_path
  end
  
  private
    def scene_params
      params.require(:scene).permit(:name, :goal, :question, :disaster, :hanger)
    end
end