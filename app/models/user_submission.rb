class UserSubmission < ApplicationRecord
  PLAN_NAMES = ['free', 'pro']

  validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text, on: :create, message: "can't be blank"
  validates_inclusion_of :plan_name, in: PLAN_NAMES

  after_update :send_mailer

  def name
    "#{first_name} #{last_name}"
  end

  def send_mailer
    # TODO: trigger a mailer
    puts "SENDING MAILER..."
    UserSubmissionMailer.reject(self).deliver if status == 'Rejected'
    UserSubmissionMailer.accept(self).deliver if status == 'Accepted'
  end
end