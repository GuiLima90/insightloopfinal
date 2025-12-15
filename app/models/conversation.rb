class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :classification, optional: true
  belongs_to :category, optional: true

  before_validation :set_default_occurred_on, on: :create
  after_create :generate_classification_and_category

  validates :category, inclusion: { in: ->(_) { Category.pluck(:name) } }, allow_nil: true

  private

  def set_default_occurred_on
    self.occurred_on ||= Date.current
  end

  def generate_classification_and_category
    # call ruby llm to tag and clategories
    tags = Classification.all.pluck(:tag).join(", ")
    categories = Category.all.pluck(:name, :description)
    categories_prompt = categories.map do |name, description|
      "#{name}: #{description}"
    end.join("\n")

    ruby_llm_chat = RubyLLM.chat

    system_prompt = <<~PROMPT
    "You are a strict classifier of customer support conversations\n\nYour task: Read the conversation content.\n\nChoose ONLY ONE tag on the list below that best represents the MAIN issue of the conversation.\n\nChoode ONLY ONE category that best represents the TYPE of the conversation.\n\nAnswer the exactly one tag, with no extra words.\n\nAvailable tags: #{tags}.\n\nAvailable categories: #{categories_prompt}.\n\nOutput JSON only (no extra text): {"tag":"<tag>","category":"<category>"}
    PROMPT
    ruby_llm_chat.with_instructions(system_prompt)

    response = ruby_llm_chat.ask(self.content)
    parsed = JSON.parse(response.content) rescue {}

    tag_value = parsed["tag"].to_s.strip
    category_value = parsed["name"].to_s.strip
    classification = Classification.find_by(tag: tag_value)
    category = Category.find_by(name: category_value)

    self.update(classification: classification, category: category_value.presence)
  end
end
