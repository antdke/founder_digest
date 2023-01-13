class UserSubmission < ApplicationRecord
  PLAN_NAMES = ['free', 'pro']

  validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text, on: :create, message: "can't be blank"
  validates_inclusion_of :plan_name, in: PLAN_NAMES

  after_update :process_submission

  def name
    "#{first_name} #{last_name}"
  end

  def process_submission
    reject! if status == "Rejected"
    accept! if status == "Accepted"
  end

  def reject!
    UserSubmissionMailer.reject(self).deliver
  end

  def accept!
    password = generate_password
    created_user = User.create!(email: self.email, password: password)
    UserSubmissionMailer.accept(self, created_user).deliver
  end

  def generate_password
    SecureRandom.hex(10)
  end
  
end