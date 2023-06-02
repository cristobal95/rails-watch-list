class Bookmark < ApplicationRecord
  belongs_to :movie
  #bookmark.movie
  belongs_to :list
  #bookmark.list

  validates :comment, presence: true
  validates :comment, length: {minimum: 6}
  validates :list, uniqueness: { scope: :movie }
end
