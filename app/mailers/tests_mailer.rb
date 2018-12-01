class TestsMailer < ApplicationMailer
  def completed_test(participation)
    @user = participation.user
    @test = participation.test
    mail to: @user.email
  end
end
