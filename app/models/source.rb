class Source < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  belongs_to :sourceable, polymorphic: true
end
