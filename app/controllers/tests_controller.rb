class TestsController < ApplicationController
  before_action :find_test, except: [:index]

#. Следуя принципам  REST, cоздайте контроллер для ресурса вопросов и реализуйте методы:
#* Просмотра списка вопросов теста 
#* Просмотра конкретного вопроса теста 
#* Создания вопроса. Идентификатор теста к которому принадлежит вопрос можно указать явно в составе URL значения атрибута action в тэге form 
#* Удаления вопроса
#* Используйте метод render внутри действия контроллера чтобы вернуть ответ клиенту как простой текст (plain text) или HTML
#* Используйте обратный вызов при поиске теста в контроллере ресурса вопросов 


  def index
    test = Test.all
    puts test
    render plain: 'All tests'
  end

  def show
   # render plain: 'Test'
   # render inline: "<%= @test.title %>"
    #<>
  render plain: @questions
  result = ["class: #{params.class}, params: #{params.inspect}"]
  #render plain: result.join("\n")

  end



  private

  def find_test
    @test = Test.find(params[:id])
    @questions = @test.questions

  end

#Test.create(test_params)
#def test_params
#  params.require(:test).permit(:title, :level)
#end






end