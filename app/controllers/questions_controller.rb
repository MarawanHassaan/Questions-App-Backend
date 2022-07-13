class QuestionsController < InheritedResources::Base

  before_action :set_question, only: %i[show edit update destroy]


  def index
    @questions = Question.all
  end

  def gett
    @questions = Question.all
    @questionlist = @questions.map do |u|
      { :id => u.id, :title => u.title, :content => u.content, :customer_id => u.customer_id, :customer_name => u.customer.name,
      :category => u.category }
    end
    json = @questionlist.to_json
    render json: @questionlist
  end
  


  def show
  end

  def destroy
    puts "Arrived Here *****************"
    @question= Question.find(params[:id])
    puts "Arrived Here ^^^^^^^^^^^^^^^^^"
    @question.destroy
  end

  def update
    puts "update the question please *******************"
    Question.update(params[:id], :title => params[:title], :content => params[:content], :category => params[:category])
    #
  end


  def create
    #new_question = Question.create()
    
    order_items_json = params['_json']
    order_items_json.each do |item|
      puts item
      @question= Question.create(
          title: item['title'],
          content: item['content'],
          category: item['category'],
          customer_id: current_customer.id
      )

      
    end
    render json: [@question.id]
  end
  private
  def set_question
    @question = Question.find(params[:id])
  end
    
  def question_params
    params.require(:question).permit(:title, :content, :customer_id)
  end

end
