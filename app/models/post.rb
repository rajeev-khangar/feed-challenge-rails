class Post < ApplicationRecord
  belongs_to :user	
  has_one :activity, inverse_of: :post
  accepts_nested_attributes_for :activity, allow_destroy: true
end
