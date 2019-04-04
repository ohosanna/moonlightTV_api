class LiveGroup < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :channels, dependent: :destroy
end
