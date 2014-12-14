class TraitsController < ApplicationController
  http_basic_authenticate_with name: "alex", password: "jackjack"

  def index
    @tag = Tag.find(params[:tag_id])
    @traits = @tag.traits
  end
  
  def new
    @tag = Tag.find(params[:tag_id])
    @trait = @tag.traits.new
  end

  def create
    @tag = Tag.find(params[:tag_id])
    @trait = @tag.traits.create(trait_params)
    
    if @trait.save
      redirect_to novel_path(@tag.novel_id)
    else
      render 'new'
    end
  end

  def show
    @tag = Tag.find(params[:tag_id])
    @trait = @tag.traits.find(params[:id])
  end
  
  def edit
    @tag = Tag.find(params[:tag_id])
    @trait = @tag.traits.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:tag_id])
    @trait = @tag.traits.find(params[:id])
    
    if @trait.update(trait_params)
      redirect_to novel_path(@tag.novel_id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @tag = Tag.find(params[:tag_id])
    @trait = @tag.traits.find(params[:id])
    @trait.destroy
    
    redirect_to novel_path(@tag.novel_id)
  end

  private
    def trait_params
      params.require(:trait).permit(:name, :description)
    end

end