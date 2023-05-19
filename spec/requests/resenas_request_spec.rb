require 'rails_helper'
require 'faker'

class ResenaTest < ActiveSupport::TestCase

  RSpec.describe "Resenas", type: :request do
    before(:each) do
      @valid_attributes = {
        calificacion: 4,
        contenido: "Muy buen curso",
        course_id: 15,
        user_id: 15
      }
      @invalid_attributes = {
        calificacion: 7,
        contenido: "bu",
        course_id: 99,
        user_id: 99
      }
      @user_attributes = {
        email: "nicemail@uc.cl",
        name: "Usuario",
        last_name: "Ejemplar",
        profile_picture: "pic.jpg",
        password: "password"
      }
      @course_attributes = {
        name: "Nombre",
        description: "Descripción",
        category: "Caregoria"
      }
      @course = FactoryBot.create(:course)
      @user = FactoryBot.create(:user)
      @resena = Resena.create(@valid_attributes)
    end

    describe "new" do 
      it "should return a successful request" do
        user = User.create(@user_attributes)
        sign_in user
        resena = Resena.create(@valid_attributes)
        #user.id = resena.user_id
        resena.user_id = user.id
        get "/courses/#{@course.id}/resenas/new"
        expect(response).to have_http_status(:ok)
      end
    end

    describe "index" do
      it "should return a successful request" do
        user = User.create(@user_attributes)
        sign_in user
        resena = Resena.create(@valid_attributes)
        resena.user_id = user.id
        #user.id = resena.user_id
        get "/courses/#{@course.id}/resenas"
        expect(response).to have_http_status(:ok)
      end
    end

    # describe "edit" do
    #   it "should return a successful request" do
    #     user = User.create(@user_attributes)
    #     sign_in user
    #     resena = Resena.create(@valid_attributes)
    #     resena.user_id = user.id
    #     resena.course_id = @course.id
    #     #resenas = Resena.all.pluck(:course_id, :id)
    #     #resena.id = 1
    #     get "/courses/#{@course.id}/resenas/#{resena.id}/edit"
    #     expect(response).to have_http_status(:ok)
    #   end
    # end

    describe "show" do
      it "should return a successful request" do
        user = User.create(@user_attributes)
        sign_in user
        resena = Resena.create(@valid_attributes)
        resenas = Resena.all.pluck(:course_id, :id)
        resena.user_id = user.id
        get "/courses/#{@course.id}/resenas"
        expect(response).to have_http_status(:ok)
      end
    end


    # describe "delete" do
    #   context "existing resena" do
    #       it "removes resenas from the resenas" do
    #         user = User.create(@user_attributes)
    #         sign_in user
    #         resena = Resena.create(@valid_attributes)
    #         user.id = resena.user_id
    #         resena.course_id = @course.id
    #         id = resena.id
    #         resenas = Resena.all
    #         resenas.delete id
    #         #delete "/courses/#{@course.id}/resenas/#{resena.id}"
    #         get "/courses/#{@course.id}/resenas"
    #         #expect(response).to redirect_to("/courses/#{@course.id}/resenas")
    #         #expect(response).to have_http_status(:ok)
    #         expect(response).to redirect_to(course_resenas_path)
    #       end
    #   end
    # end


  end
end




