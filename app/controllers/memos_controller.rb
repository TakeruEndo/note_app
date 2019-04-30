class MemosController < ApplicationController


    def index
        @book = Book.new
        @books = Book.all
    end

    def new
        @memo = Memo.new
    end
    def create
        @memo = Memo.new

        @memo.book_id = params['memo']['book_id']
        @memo.heading = params['memo']['heading']
        @memo.content = params['memo']['content']

        if @memo.save
            flash[:success] = "Micropost deleted"
            redirect_to "/books/" + params['memo']['book_id']
        end

    end

    def show
        @memo = Memo.find(params[:id])
        render "new"
    end

    def destroy
        memo = Memo.find(params[:id])
        book_id = memo.book_id.to_s
        Memo.find(params[:id]).destroy
        flash[:success] = "Memo deleted"
        redirect_to "/books/" + book_id
    end

end