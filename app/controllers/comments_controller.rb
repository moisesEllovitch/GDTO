class CommentsController < ApplicationController

  before_action :set_category
  before_action :set_item#, only: [:create, :index, :show, :edit, :update, :destroy]

  before_action :set_comments
  before_action :set_comment, only: [:edit, :update, :destroy]

  # Apenas usuários podem criar comentários. 
  before_action :authorize

  def new
    @comment = Comment.new
  end

  def create
    # Encontrar o item que será o pai do novo comentário - já está no set_item
    # @item = Item.find(params[:item_id])

    # Criar e salvar o comentário
    @comment = @item.comments.create(comment_params)

    # Redirecionar para show de item.
    #@error_message = @comment.errors.full_messages
    #redirect_to item_path(@item, @error_message)
    redirect_to category_item_path(@category, @item)
  end

  def index
  end

  def edit
  end   

  def show
  end

  def update
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to category_item_path(@category, @item), notice: 'Comment was successfully updated.' }
        #format.json { head :no_content } NAO SEI PRA QUE SERVE ISSO!
      else
        format.html { render action: "edit" }
        #format.json { render json: @item.comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to category_item_path(@category, @item), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body, :score)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_comments
    @comments = @item.comments
  end

  def set_comment
    @comment = @item.comments.find(params[:id])
  end
end
