class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user_id, uniqueness: { scope: :item_id }, presence: true
  validates :item_id, uniqueness: { scope: :user_id }, presence: true

  paginates_per 20
end
