class FeedbacksController < ApplicationController
  expose_decorated :feedback

  def create
    feedback.save

    send_feedback
    
    respond_with feedback, location: feedbacks_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(
      :full_name,
      :email,
      :title,
      :text
    )
  end

  def send_feedback
    FeedbackMailer.send_feedback(
      feedback.full_name,
      feedback.email,
      feedback.title,
      feedback.text
    ).deliver_now
  end
end
