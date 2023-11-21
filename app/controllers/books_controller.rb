class BooksController < ApplicationController
  before_action :set_book, only: %i[ show ]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.find(book_params)
    if @book.save
      redirect_to @book, notice: "Book was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :price)
  end
end