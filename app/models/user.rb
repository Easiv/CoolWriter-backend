class User < ApplicationRecord
  validates :email, uniqueness: true
                    #format: { with: /^.+@.+$/ }
end
