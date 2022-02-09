class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :faborites, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def faborited_by?(user)
    faborites.where(user_id: user.id).exists?
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
  
  scope :sort_books, -> (sort) { order(sort[:sort]) }
  scope :sort_list, -> {
    {
      "並び替え" => "",
      "作成の新しい順" => "updated_at DESC",
      "評価の高い順" => "star DESC"
    }
  }
  
end
