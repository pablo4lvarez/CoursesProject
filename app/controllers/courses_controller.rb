class CoursesController < ApplicationController
  # before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    @course = Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses or /courses.json
  def create
    @course_params = params.require(:course).permit(:name, :description, :category, :instructor)
    @course = Course.new(@course_params)
    if @course.save
      # format.html { redirect_to @course, notice: "Course was successfully created." }
      # format.json { render :show, status: :created, location: @course }
      @user = current_user
      @course.users.push(@user)   
      redirect_to root_path, notice: 'Course successfully created'
    else
      redirect_to new_course_path, notice: 'Error while creating course, make sure no field is empty'
    end


    # respond_to do |format|
    #   if @course.save
    #     format.html { redirect_to @course, notice: "Course was successfully created." }
    #     format.json { render :show, status: :created, location: @course }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @course.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    @course = Course.find(params[:id])
    @course_new_params = params.require(:course).permit(:name, :description, :category, :instructor)
    if @course.update(@course_new_params)
      redirect_to course_path(@course), notice: 'Course successfully edited'
    else
      redirect_to edit_course_path(@course), 
                  notice: 'Error while editing course, make sure no field is empty'
    end
  end

    # respond_to do |format|
    #   if @course.update(course_params)
    #     format.html { redirect_to @course, notice: "Course was successfully updated." }
    #     format.json { render :show, status: :ok, location: @course }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @course.errors, status: :unprocessable_entity }
    #   end
    # end
  # end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to root_path, notice: 'Course deleted'

    # @course = Course.find(params[:id])
    # @course.destroy
    # respond_to do |format|
    #   format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  def signup
    @user = current_user
    @course = Course.find(params[:course_id])
    @course.users.push(@user)

    redirect_to courses_path, notice: 'Signed up for new course'
  end

  def unsubscribe
    @user = current_user
    @course = Course.find(params[:course_id])
    @course.users.delete(@user)
    @user.courses.delete(@course)

    redirect_to courses_path, notice: 'Succesfully unsubscribed one of your courses'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find_by(id: params[:id])
  end

    # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :description, :category, :instructor)
  end
end
