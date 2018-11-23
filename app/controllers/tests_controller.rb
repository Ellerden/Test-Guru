# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[destroy show update edit start]
  before_action :set_questions, only: %i[destroy show update edit start]
  before_action :find_user, only: %i[start new create update]

  def index
    @tests = Test.all
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def new
    @test = @user.created_tests.build
  end

  # по умолчанию добавляю пока все тесты первому юзеру как автору.
  def create
    @test = @user.created_tests.build(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

 # возможность удалять тест (кнопка, ссылка) пока нигде не используется
  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.participation(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_questions
    @questions = @test.questions
  end

# пока нет системы аутентификации и идентификации - дальше это надо будет исправить
  def find_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
