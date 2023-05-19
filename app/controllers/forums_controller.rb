class ForumsController < ApplicationController
  def new
    @forum = Forum.new
    @forum.course_id = params[:course_id]
  end

  def create
    @forums_params = params.require(:forum).permit(:name, :course_id)
    @forum = Forum.create(@forums_params)
    if @forum.save
      redirect_to course_forums_path(:course_id => @forum.course_id), notice: 'Forum successfully created'
    else
      redirect_to new_course_forum_path(:course_id => @forum.course_id), 
                  notice: 'Error while creating forum, make sure name is not empty'
    end
  end

  def index
    @course = Course.find(params[:course_id])
    @forums = @course.forums
  end

  # def show
  #   @forum = Forum.find(params[:id])
  #   @message = @forum.messages.new
  # end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    @forums_new_params = params.require(:forum).permit(:name)
    if @forum.update(@forums_new_params)
      redirect_to course_forums_path(:course_id => @forum.course_id), notice: 'Forum successfully edited'
    else
      redirect_to edit_course_forum_path(@forum.course_id, @forum.id), 
                  notice: 'Error while editing forum, make sure name is not empty'
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    redirect_to course_forums_path(:course_id => @forum.course_id), notice: 'Forum deleted'
  end
end
