class FaboritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    faborite = current_user.faborites.new(book_id: @book.id)
    faborite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    faborite = current_user.faborites.find_by(book_id: @book.id)
    faborite.destroy
  end
end
