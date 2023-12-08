class AppPassword < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :token, presence: true, uniqueness: true

  before_validation :set_token, on: :create

  def set_token
    self.token = "kairan-" + SecureRandom.hex(32)
  end
end
