class Share < ApplicationRecord
  belongs_to :user
  has_one :activity
  accepts_nested_attributes_for :activity, allow_destroy: true
end
