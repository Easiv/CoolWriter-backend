module Api
  module V1
    class BooksController < JSONAPI::ResourceController
      skip_before_action :verify_authenticity_token
      def destroy
        @book = Book.find(params[:id])
        Pundit.authorize(, @book, :book_policy)
      end
    end
  end
end
