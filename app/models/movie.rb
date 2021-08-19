class Movie < ApplicationRecord
  validates :title, uniqueness: true
  has_many :bookmarks

  validates :title, :overview, presence: true

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    false if bookmarks.count.positive?
  end
end
