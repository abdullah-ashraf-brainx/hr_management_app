class CandidateMailer < ApplicationMailer
    
    def send_email
        @candidate = params[:candidate]
        @message = params[:message]
    
        mail(to: @candidate.email, subject: "Message from Job Recruiter")
    end
end
