class SequelsController < ApplicationController
  http_basic_authenticate_with name: "alex", password: "jackjack"
  
  def index
    @novel = Novel.find(params[:novel_id])
    @sequels = @novel.sequels
  end
  
  def new
    @novel = Novel.find(params[:novel_id])
    @sequel = @novel.sequels.new
  end
  
  def create
    @novel = Novel.find(params[:novel_id])
    @sequel = @novel.sequels.create(sequel_params)
    
    if @sequel.save
      redirect_to novel_path(@novel.id)
    else
      render 'new'
    end
  end
  
  def show
    @novel = Novel.find(params[:novel_id])
    @sequel = @novel.sequels.find(params[:id])
  end
  
  def edit
    @novel = Novel.find(params[:novel_id])
    @sequel = @novel.sequels.find(params[:id])
  end
  
  def update
    @novel = Novel.find(params[:novel_id])
    @sequel = @novel.sequels.find(params[:id])
    
    if @sequel.update(sequel_params)
      redirect_to novel_path(@novel.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @novel = Novel.find(params[:novel_id])
    @sequel = @novel.sequels.find(params[:id])
    @sequel.destroy
    
    redirect_to novel_path(@novel.id)
  end
  
  private
    def sequel_params
      params.require(:sequel).permit(:name, :emotion, :logic, :decision, :text)
    end
end