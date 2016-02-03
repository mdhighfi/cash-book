class Comment < ActiveRecord::Base
  validates :user_id, :item_id, :date, :content,
            :created_at, :updated_at, presence: true

  belongs_to :user
  belongs_to :item
end
