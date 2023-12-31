class User < ApplicationRecord
  has_many :marks, dependent: :destroy
  has_many :items, through: :marks
  has_many :app_passwords, dependent: :destroy

  validates :name, presence: true, length: { in: 2..15 }
  validates :email, presence: true, length: { maximum: 319 }
  validates :icon_url, presence: true, length: { maximum: 255 }

  def to_param
    name
  end
end
