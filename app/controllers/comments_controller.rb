class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    comments = Comment.find_by_sql('SELECT * FROM comments WHERE patient_id = '+params[:patient_id])
    render json: comments
  end

 def show
   comment = Comment.find(params[:id])
   render json: comment
 end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json:comment
    else
      render json:{message: 'ERROR'}
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update_attributes(comment_params)
      render json: comment
    else
      render json: {mistake: 'ERROR'}
    end
  end


 def comment_params
   params.permit( :commentValue,:patient_id)
 end

end