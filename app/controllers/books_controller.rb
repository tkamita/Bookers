class BooksController < ApplicationController

  def index
    # @book = Book.new
    @books = Book.all.order(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'successfully updated'
    else
      render 'edit'
    end
  end

  # def new
  # 	@book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'successfully created'
    else
      @books = Book.all.order(created_at: :desc)
      render 'index'
    end
    # book = Book.new(book_params)
    # if book.errors.any?
    #   redirect_to books_path
    #   # render action: :index
    # else
    #   # book = Book.find(book_params)
    #   # book.destroy
    #   if book.save
    #     redirect_to book_path(book.id), notice: 'successfully created'
    #   end
      
    # end
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
