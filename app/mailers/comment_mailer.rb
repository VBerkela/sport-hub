class CommentMailer < ApplicationMailer
  def new_comment_email(comment, user)
    @user = user
    @comment = comment
    mail(to: @user.email, subject: 'Check new comment!')
  end
end
