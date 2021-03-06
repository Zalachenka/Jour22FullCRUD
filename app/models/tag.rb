class Tag < ApplicationRecord
  has_many :tag_gossip_links
  has_many :gossips, through: :tag_gossip_links
  validates :title, length: { in: 2..50 }, presence: true
end
