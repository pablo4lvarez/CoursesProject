require 'rails_helper'
require 'faker'

class ForumTest < ActiveSupport::TestCase

  RSpec.describe "Forums", type: :request do
    before (:each) do
      @valid_attributes = {
        name: "Foro Curso 23",
        course_id: 23
      }
      @invalid_attributes = {
        name: "Nombre malo Foro",
        course_id: 99
      }
      @user_attributes = {
        email: "nicemail@uc.cl",
        name: "Usuario",
        last_name: "Ejemplar",
        profile_picture: "pic.jpg",
        password: "password",
        user_type: "alumno"
      }
      @message_attributes = {
        contenido: "contenido",
        user_id: rand(10),
        forum_id: rand(10)
      }
      @course = FactoryBot.create(:course)
      #@course.id = rand(3)
      @forum = Forum.create(@valid_attributes)
      #@message = FactoryBot.create(:message)

    end

    describe "index" do
      it "should return a successful request" do
        user = User.create(@user_attributes)
        sign_in user
        get "/courses/#{@course.id}/forums"
        expect(response).to have_http_status(:ok)
      end
    end

    describe "new" do 
      it "should return a successful request" do 
        user = User.create(@user_attributes)
        sign_in user
        forum = Forum.create(@valid_attributes)
        @course.id = forum.course_id

        get "/courses/#{@course.id}/forums/new"
        expect(response).to have_http_status(:ok)
      end
    end


      describe "show" do
        it "should return a successful request" do
          user = User.create(@user_attributes)
          sign_in user
          forum = Forum.create(@valid_attributes)
          forum.course_id = @course.id
          
          message = Message.create(@message_attributes)
          message.forum_id = forum.id
          mensajes = forum.messages.new
          get "/courses/#{@course.id}/forums/#{forum.id}"
          #get "/courses/#{@course.id}/forums/#{forum.id}"
          #get "/courses/#{@course.id}/forums"
          expect(response).to have_http_status(:ok)
        end
      end

      describe "edit" do
        it "should return a successful request" do
          user = User.create(@user_attributes)
          sign_in user
          forum = Forum.create(@valid_attributes)
          forum.course_id = @course.id
          message = Message.create(@message_attributes)
          message.forum_id = forum.id
          mensajes = forum.messages.new

          get "/courses/#{@course.id}/forums/#{forum.id}"
          expect(response).to have_http_status(:ok)
        end
      end



  end
end




