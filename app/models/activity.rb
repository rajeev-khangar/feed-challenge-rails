class Activity < ApplicationRecord
  belongs_to :post, inverse_of: :activity, optional: true
  belongs_to :share, inverse_of: :activity, optional: true
  after_save :activity_type 


  def activity_type
    if self.post.present?
      self.update_attributes(verb: "posted", object: "Post:#{post.id}")
    else
     	self.update_attributes(verb: "shared", object: "Share:#{share.id}")
    end
  end
end
