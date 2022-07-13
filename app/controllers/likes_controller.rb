class LikesController < InheritedResources::Base
  
  def create
    #new_question = Question.create()
    
    order_items_json = params['_json']
    order_items_json.each do |item|
      puts item
      @like= Like.create(
          customer_id: current_customer.id,
          comment_id: item['comment_id'],
          counter: item['counter']
      )
      
    end
    render json: ["id": @like.id]
  end

  def destroy
    puts "Deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
        @like= Like.find(params[:id])
        puts "daaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @like.destroy
  end


  def update
    puts "update the like"
    Like.update(params[:id], :counter => Integer(params[:counter]))
  end

  private

    def like_params
      params.require(:like).permit(:customer_id, :comment_id)
    end

end
