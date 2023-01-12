class UserSubmission < ApplicationRecord
  PLAN_NAMES = ['free', 'pro']

  validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text, on: :create, message: "can't be blank"
  validates_inclusion_of :plan_name, in: PLAN_NAMES

end