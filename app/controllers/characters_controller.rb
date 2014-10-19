class CharactersController < ApplicationController
  http_basic_authenticate_with name: "alex", password: "jackjack"
  
  def index
    @novel = Novel.find(params[:novel_id])
    @characters = @novel.characters
  end
  
  def new
    @novel = Novel.find(params[:novel_id])
    @character = @novel.characters.new
  end
  
  def create
    @novel = Novel.find(params[:novel_id])
    @character = @novel.characters.create(character_params)
    
    if @character.save
      redirect_to novel_characters_path
    else
      render 'new'
    end
  end
  
  def show
    @novel = Novel.find(params[:novel_id])
    @character = @novel.characters.find(params[:id])
  end
  
  def edit
    @novel = Novel.find(params[:novel_id])
    @character = @novel.characters.find(params[:id])
  end
  
  def update
    @novel = Novel.find(params[:novel_id])
    @character = @novel.characters.find(params[:id])
    
    if @character.update(character_params)
      redirect_to novel_characters_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @novel = Novel.find(params[:novel_id])
    @character = @novel.characters.find(params[:id])
    @character.destroy
    
    redirect_to novel_characters_path
  end
  
  private
    def character_params
      params.require(:character).permit(:name)
    end
end