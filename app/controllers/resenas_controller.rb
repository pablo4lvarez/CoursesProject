class ResenasController < ApplicationController
  before_action :set_resena, only: %i[ show edit update destroy ]

  # GET /resenas or /resenas.json
  def index
    @course = Course.find(params[:course_id])
    @resenas = @course.resenas
  end

  # GET /resenas/1 or /resenas/1.json
  # def show
  #   @resena = Resena.find(params[:id])
  # end

  # GET /resenas/new
  def new
    @resena = Resena.new
    @resena.course_id = params[:course_id]
    @resena.user_id = params[:user_id]
  end

  # GET /resenas/1/edit
  def edit
    @resena = Resena.find(params[:id])
  end

  # POST /resenas or /resenas.json
  def create
    @resenas_params = params.require(:resena).permit(:calificacion, :contenido, :course_id, :user_id) 
    @resena = Resena.create(@resenas_params)
    if @resena.save
      @user = User.find(@resena.user_id)
      @resena.user = @user
      redirect_to course_resenas_path(:course_id => @resena.course_id), notice: 'Review successfully created'
    else
      redirect_to new_course_resena_path(:course_id => @resena.course_id), 
                  notice: 'Error while creating review, make sure score is an int between 1-5'
    end
  end

  # PATCH/PUT /resenas/1 or /resenas/1.json
  def update
    @resena = Resena.find(params[:id])
    @resenas_new_params = params.require(:resena).permit(:calificacion, :contenido)
    if @resena.update(@resenas_new_params)
      redirect_to course_resenas_path(:course_id => @resena.course_id), notice: 'Review successfully edited'
    else
      redirect_to edit_course_resena_path(@resena.course_id, @resena.id), 
                  notice: 'Error while editing review, make sure score is an int between 1-5'
    end
  end

  # DELETE /resenas/1 or /resenas/1.json
  def destroy
    @resena = Resena.find(params[:id])
    @resena.destroy

    redirect_to course_resenas_path(:course_id => @resena.course_id), notice: 'Review deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_resena
    @resena = Resena.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def resena_params
    params.require(:resena).permit(:calificacion, :contenido)
  end
end
