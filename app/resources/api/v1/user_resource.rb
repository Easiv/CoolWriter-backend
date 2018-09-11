module Api
  module V1
    class UserResource < JSONAPI::Resource
      attributes :name, :photo_url, :email, :isAdmin
      has_many :books
    end
  end 
end