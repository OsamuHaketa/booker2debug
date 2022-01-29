class FaboritesController < ApplicationController

  def create
    Faborite.create(user_id: current_user.id, book_id: params[:id])
    redirect_to books_path
  end

  def destroy
    Faborite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
    redirect_to books_path
  end
end
