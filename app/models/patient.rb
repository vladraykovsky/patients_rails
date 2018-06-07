class Patient < ApplicationRecord
  has_many :comments , dependent: :delete_all
end
