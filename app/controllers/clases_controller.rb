class ClasesController < ApplicationController
  def new
    @clase = Clase.new
    @clase.course_id = params[:course_id]
  end

  def create
    @clases_params = params.require(:clase).permit(:numero, :nombre, :contenido, :course_id)
    @clase = Clase.create(@clases_params)
    if @clase.save
      redirect_to course_path(:id => @clase.course_id), notice: 'Class successfully created'
    else
      redirect_to new_course_clase_path(@clase.course_id), 
                  notice: 'Error while creating class, make sure no field is empty'
    end
  end

  # def index
  #   @clases = Clase.all
  # end

  def show
    @clase = Clase.find(params[:id])
    @course = Course.find(@clase.course_id)
  end

  def edit
    @clase = Clase.find(params[:id])
  end

  def update
    @clase = Clase.find(params[:id])
    @clases_new_params = params.require(:clase).permit(:numero, :nombre, :contenido)
    if @clase.update(@clases_new_params)
      redirect_to course_clase_path(@clase.course_id, @clase.id), notice: 'Class successfully edited'
    else
      redirect_to  edit_course_clase_path(@clase.course_id, @clase), 
                   notice: 'Error while editing class, make sure no field is empty'
    end
  end

  def destroy
    @clase = Clase.find(params[:id])
    @clase.destroy

    redirect_to course_path(@clase.course_id), notice: 'Class deleted'
  end
end
