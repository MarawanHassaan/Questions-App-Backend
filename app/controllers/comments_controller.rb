class CommentsController < ApplicationController

    def test
        p "comments are called"
        
        @comments = Comment.all
        @commentlist = @comments.map do |u|
            { :id => u.id, :body => u.body, :customer_id => u.customer_id, :question_id => u.question_id, 
            :customer_name => u.customer.name, :users_like => u.liking_users, :testing => u.likes}
        end
        json = @commentlist.to_json
        render json: @commentlist
    end
    

    def create
        #new_question = Question.create()
        
        order_items_json = params['_json']
        order_items_json.each do |item|
          puts item
          @comment= Comment.create(
              body: item['body'],
              question_id: item['question_id'],
              customer_id: current_customer.id
          )
    
          
        end
        render json: [@comment.id]
    end
    

    def destroy
        puts "cvcvcvcv"
        @comment= Comment.find(params[:id])
        puts "cvcvcvcv"
        @comment.destroy
    end
    
    def update
        puts "update the comment"
        Comment.update(params[:id], :body => params[:body])
    end


    private
        def comment_params
      	    params.require(:comment).permit(:customer_id, :body)
        end
        def set_comment
            @comment = Comment.find(params[:id])
        end
end
