class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :conversation

  include ActionView::Helpers::DateHelper

  def jsonify
    self.attributes.merge(extra_ajax_data)
  end

  private

  def extra_ajax_data
    {sender_name: self.sender.first_name,
     time_ago: time_ago_in_words(self.created_at),
     html_body: self.text.gsub(/\r\n/, '<br>') }
  end
end
