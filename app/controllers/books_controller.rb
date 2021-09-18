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
       flash[:notice] = "Book was successfully created"#9/18
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      render :index
     end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])#@
    if @book.update(book_params)#@
      flash[:notice] = "Book was successfully update"
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    if book.destroy  # データ（レコード）を削除
     flash[:notice] = "Book was successfully destroy"
      redirect_to books_path  # 投稿一覧画面へリダイレクト  end
    else
      render :new
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
