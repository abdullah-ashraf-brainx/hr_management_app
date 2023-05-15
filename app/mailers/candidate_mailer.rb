class CandidateMailer < ApplicationMailer
    
    def send_email_to_candidate
        @email = params[:email]
        @message = params[:message]
    
        mail(to: @email, subject: "Message from Job Recruiter")
    end
end
