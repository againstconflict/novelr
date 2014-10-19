class TraitsController < ApplicationController

  def index
    @character = Character.find(params[:character_id])
    @traits = @character.traits
  end
  
  def new
    @character = Character.find(params[:character_id])
    @trait = @character.traits.new
  end

  def create
    @character = Character.find(params[:character_id])
    @trait = @character.traits.create(trait_params)
    
    if @trait.save
      redirect_to character_traits_path
    else
      render 'new'
    end
  end

  def show
    @character = Character.find(params[:character_id])
    @trait = @character.traits.find(params[:id])
  end
  
  def edit
    @character = Character.find(params[:character_id])
    @trait = @character.traits.find(params[:id])
  end
  
  def update
    @character = Character.find(params[:character_id])
    @trait = @character.traits.find(params[:id])
    
    if @trait.update(trait_params)
      redirect_to character_traits_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @character = Character.find(params[:character_id])
    @trait = @character.traits.find(params[:id])
    @trait.destroy
    
    redirect_to character_traits_path
  end

  private
    def trait_params
      params.require(:trait).permit(:name, :description)
    end

end