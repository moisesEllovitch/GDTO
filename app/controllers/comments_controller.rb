class CommentsController < ApplicationController

  # Apenas usuários podem criar comentários. 
  before_action :authorize


  def create
    # Encontrar o item que será o pai do novo comentário
    @item = Item.find(params[:item_id])

    # Criar e salvar o comentário
    @comment = @item.comments.create(comment_params)

    # Redirecionar para show de item.
    #@error_message = @comment.errors.full_messages
    #redirect_to item_path(@item, @error_message)
    redirect_to item_path(@item)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :score)
  end

end
