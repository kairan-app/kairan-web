class Item < ApplicationRecord
  has_many :marks, dependent: :destroy
  has_many :users, through: :marks

  validates :url, uniqueness: true, presence: true, length: { maximum: 8000 }
  validates :title, length: { maximum: 256 }
  validates :description, length: { maximum: 1024 }
  validates :image_url, length: { maximum: 8000 }

  def update_metadata
    og = OpenGraph.new(url)
    self.title = og.title
    self.description = og.description
    self.image_url = og.images.first
    save
  end
end
