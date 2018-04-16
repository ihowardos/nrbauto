class FeedbackMailer < ApplicationMailer
  default to: "from@example.com"

  def send_feedback(full_name, email, title, text)
    @full_name = full_name
    @email = email
    @title = title
    @text = text

    mail(to: "from@example.com", from: @full_name, subject: @title)
  end
end
