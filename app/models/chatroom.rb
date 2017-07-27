class Chatroom < ApplicationRecord
  has_many :chatroom_users,dependent: :destroy
  has_many :users,through: :chatroom_users
  has_many :messages,dependent: :destroy

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
    user_ids = users.map(&:id).sort
    name = "DM:#{user_ids.join(":")}"

    if chatroom = Chatroom.where(title: name,direct_messages: true).first
      chatroom
    else
      # create a new chatroom
      chatroom = new(title: name, direct_messages: true)
      chatroom.users = users
      chatroom.save
      chatroom
    end
  end
end
