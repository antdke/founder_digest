class UserSubmissionsController < ApplicationController
  def create
    puts "WHITELISTED PARAMS: #{user_submission_params}"
    # accept client/form request 
    # create a UserSubmission record
    UserSubmission.create!(user_submission_params)
    redirect_to root_path, notice: "Thanks for submitting!"
  end

  private

  def user_submission_params
    params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :job_role, :text) 
  end
  
end