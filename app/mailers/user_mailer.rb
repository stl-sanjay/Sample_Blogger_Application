class UserMailer < ApplicationMailer
  
  default from: 'sanjay.prajapati@solutelabs.com'
   

  # Defined mailer method to send Welcome mail to user
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
