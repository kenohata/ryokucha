class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..18 }, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password
end
