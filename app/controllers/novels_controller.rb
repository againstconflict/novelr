class NovelsController < ApplicationController
  http_basic_authenticate_with name: "alex", password: "jackjack", except: :index
  
  def index
    @novels = Novel.all
  end
  
  def new
    @novel = Novel.new
  end
  
  def create
    @novel = Novel.new(novel_params)
    
    if @novel.save
      redirect_to @novel
    else
      render 'new'
    end
  end
  
  def show
    @novel = Novel.find(params[:id])
    @characters = @novel.characters
    @scenes = @novel.scenes
  end
  
  def edit
    @novel = Novel.find(params[:id])
  end
  
  def update
    @novel = Novel.find(params[:id])
    
    if @novel.update(novel_params)
      redirect_to @novel
    else
      render 'edit'
    end
  end
  
  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    
    redirect_to novels_path
  end
  
  private
    def novel_params
      params.require(:novel).permit(:title, :premise, :voice)
    end

end