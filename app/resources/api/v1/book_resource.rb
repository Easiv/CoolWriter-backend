module Api
  module V1
    class BookResource < JSONAPI::Resource
      attributes :cover, :title, :author, :description, :page_count
      has_many :pages
      has_one :user  
    end
  end 
end
