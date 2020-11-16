class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :prototype, dependent: :destroy
  validates :text, presence: true
end
