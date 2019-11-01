class User < ApplicationRecord
  include Clearance::User

  has_many :todo_lists, dependent: :destroy

  validates :email, presence: true
end
