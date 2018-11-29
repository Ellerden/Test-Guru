# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
 # skip_before_action :authenticate_user!
  before_action :find_test, only: %i[destroy show update edit]
  before_action :set_questions, only: %i[destroy show update edit]

  def index
    @tests = Test.all
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def new
    @test = current_user.created_tests.build
  end

  # тест добавляется текущему админу как автору
  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_questions
    @questions = @test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
