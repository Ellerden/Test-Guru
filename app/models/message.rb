class Message
  include ActiveModel::Model
  attr_accessor :author_name, :author_email, :body
  validates :author_name, :author_email, :body, presence: true
end
