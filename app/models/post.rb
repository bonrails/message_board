class Post < ActiveRecord::Base
  attr_accessible :message, :title,:user_id
  belongs_to :user,:foreign_key => :user_id

  validates :message, :length => { :minimum => 4 ,:maximum => 500}
  validates :title, :length => { :minimum => 2 ,:maximum => 50}

end
