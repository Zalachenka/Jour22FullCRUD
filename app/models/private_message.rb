class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_many :recipient_to_pm_links, foreign_key: 'received_message_id'
  has_many :recipients, foreign_key: 'recipient_id', class_name: 'User', through: :recipient_to_pm_links
  validates :content, presence: true
  validates :sender, presence: true
end
