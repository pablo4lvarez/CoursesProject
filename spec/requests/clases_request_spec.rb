require 'rails_helper'

class ClassTest < ActiveSupport::TestCase
  RSpec.describe "Clases", type: :request do
    before (:each) do
      @valid_attributes = {
        numero: 1,
        nombre: "clase 1",
        contenido: "clase1.mp4",
        course_id: 1
      }
      @invalid_attributes = {
        numero: 4,
        nombre: "clase 4",
        contenido: "clase4.mp4",
        course_id: 4
      }
      @user_attributes = {
        email: "nicemail@uc.cl",
        name: "Usuario",
        last_name: "Ejemplar",
        profile_picture: "pic.jpg",
        password: "password"
      }
      @course = FactoryBot.create(:course)
      @clase = Clase.create(@valid_attributes)
    end


    describe "new" do
      it "should return a successful request" do
        get "/courses/#{@course.id}/clases/new"
        expect(response).to have_http_status(:ok)
      end
    end

    # describe "index" do
    #   it "should return a successful request" do
    #     get "/clases/index"
    #     expect(response).to have_http_status(:ok)
    #   end
    # end

    describe "create" do
      context "with valid parameters" do
        it "creates a new Class" do
          expect do
              user = User.create!(@user_attributes)
              sign_in user
              course = FactoryBot.create(:course)
              clase = Clase.create(@valid_attributes)
              clase.course_id = course.id
              clase.save
              get "/courses/#{@course.id}/clases/#{clase.id}"
              expect(response).to redirect_to("/courses/#{@course.id}")
              # expect {
              #   post "/courses/clases", params: { clase: @valid_attributes }
              # }.to change(course.clases, :count).by(1)

          end
        end
      end
    end


    
    describe "show" do
      it "should return a successful request" do
        user = User.create(@user_attributes)
        sign_in user
        get "/courses/#{@course.id}/clases/#{@clase.id}"
        expect(response).to have_http_status(:ok)
      end
    end

    describe "edit" do
      it "should return a successful request" do
        user = User.create(@user_attributes)
        sign_in user
        get "/courses/#{@course.id}/clases/#{@clase.id}/edit"
        expect(response).to have_http_status(:ok)
      end
    end

    describe "delete" do
      context "existing class" do
          it "removes class from the classes" do
              clase = Clase.create(@valid_attributes)
              @course.id = 1
              @clase.course_id = @course.id
              delete "/courses/#{@course.id}/clases/#{@clase.id}"
              expect(response).to redirect_to("/courses/#{@course.id}")
          end
      end
    end
  
  end
end
