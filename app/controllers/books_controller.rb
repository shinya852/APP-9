class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new#追記
  
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
     @book = Book.new(book_params)
     if @book.save
      redirect_to books_path(@book.id)
     else
      render :new
     end
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト  end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
