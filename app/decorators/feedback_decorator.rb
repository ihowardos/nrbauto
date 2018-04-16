class FeedbackDecorator < ApplicationDecorator
  delegate :full_name, :email, :title, :text
end
