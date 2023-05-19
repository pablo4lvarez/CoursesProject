class MessagesController < ApplicationController
  def new
    @message = Message.new
    @message.forum_id = params[:forum_id]
    @message.user_id = params[:user_id]
    @forum = Forum.find(params[:forum_id])
    @messages = @forum.messages
    @course = Course.find(@forum.course_id)
  end

  def create
    @messages_params = params.require(:message).permit(:contenido, :forum_id, :user_id) 
    @message = Message.create(@messages_params)
    @forum = Forum.find(@messages_params[:forum_id])
    if @message.save
      @user = User.find(@message.user_id)
      @message.user = @user
      redirect_to new_course_forum_message_path(:course_id => @forum.course_id, :forum_id => @forum.id), 
                  notice: 'Message successfully created'
    else
      redirect_to new_course_forum_message_path(:course_id => @forum.course_id, :forum_id => @forum.id), 
                  notice: 'Error while creating message, make sure no field is empty'
    end
  end

  # def index
  #   @forum = Forum.find(params[:forum_id])
  #   @messages = @forum.messages
  # end

  def destroy
    @message = Message.find(params[:id])
    @forum = Forum.find(@message.forum_id)
    @message.destroy

    redirect_to new_course_forum_message_path(:course_id => @forum.course_id, :forum_id => @forum.id), 
                notice: 'Message deleted'
  end
end
