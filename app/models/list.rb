class List < ApplicationRecord
  belongs_to :user

  has_many :elements, dependent: :destroy

  validates :title, presence: true
end
