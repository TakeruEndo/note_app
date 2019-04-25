class BooksController < ApplicationController

  require 'net/http'
  require 'uri'
  require 'json'

  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book =  Book.find(params[:id])  
    # 今いるところでmemoを定義してあげないといけない　"First argument in form cannot contain nil or be empty"
    @memo = Memo.new
    @memos = Memo.where(book_id: params[:id])
     
  end

  def new
    @book = Book.new

  end

  def create
    @book = Book.new
    isbn = params[:book][:ISBN]
    urls = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn.to_s

    url = URI.parse(urls)
    json = Net::HTTP.get(url) #NET::HTTPを利用してAPIを叩く
    result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換
    if result['items']
      @book.authors = result['items'][0]["volumeInfo"]['authors']
      @book.title =  result["items"][0]["volumeInfo"]['title']
      @book.ISBN = isbn
      # @book.description = result["items"][0]["volumeInfo"]['description']
    end

    if @book.save
      flash[:success] = "Micropost deleted"
      redirect_to root_url
    end
    # render plain: params.inspect 

  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to root_url
  end

end
