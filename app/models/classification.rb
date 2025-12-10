class Classification < ApplicationRecord
  has_many :improvements
  has_many :conversations

  def full_text_of_conversations
    conversations.map(&:content).join("\n")
  end
end
