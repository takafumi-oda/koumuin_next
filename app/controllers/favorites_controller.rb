class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create!(favorite_params)
    render json: favorite
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    render json: favorite
  end

  private

  def favorite_params
    params.require(:favorite).permit(:post_id)
  end
end
