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
      redirect_to novel_path(@novel.id)
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
      redirect_to novel_path(@novel.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @novel = Novel.find(params[:novel_id])
    @scene = @novel.scenes.find(params[:id])
    @scene.destroy
    
    redirect_to novel_path(@novel.id)
  end
  
  def update_row_order
    @scene = Scene.find(params[:scene][:scene_id])
    @scene.row_order_position = scene_params[:row_order_position]
    @scene.save
    
    render nothing: true
  end
  
  private
  
    def set_scene
      @scene = Scene.find(params[:scene][:scene_id])
    end
    
    def scene_params
      params.require(:scene).permit(:scene_id, :name, :goal, :question, :disaster, :hanger, :conflict_text, :emotion, :logic, :decision, :sequel_text, :row_order_position)
    end
end