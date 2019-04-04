class Channel < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :live_group
  has_many :sources, as: :sourceable
end
