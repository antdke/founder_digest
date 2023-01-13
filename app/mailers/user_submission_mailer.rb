class UserSubmissionMailer < ApplicationMailer
  
  def accept(user_submission, created_user)
    @auth_code = created_user.auth_code
    @email = user_submission.email
    mail(to: user_submission.email, subject: "Welcome to Founder Digest — You've been approved!")
  end
  
  def reject(user_submission)
    
    mail(to: user_submission.email, subject: "You've been rejected!")
  end
end