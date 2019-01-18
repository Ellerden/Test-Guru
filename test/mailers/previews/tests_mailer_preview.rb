# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  def completed_test
    participation = Participation.new(user: User.first, test: Test.first)
    TestsMailer.completed_test(participation)
  end
end
