class UserMailer < ActionMailer::Base
    def forgot_password(params)
      from "system@domain.com"
      recipients params[:email]
      subject "Password Retrieval"
      body[:key] = params[:key]
    end

    def confirm_account(params)
      from "system@domain.com"
      recipients params[:email]
      subject "Account Confirmation"
      body[:key] = params[:key]
    end
end
