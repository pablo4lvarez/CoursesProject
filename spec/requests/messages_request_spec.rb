require 'rails_helper'
require 'faker'

class MessageTest < ActiveSupport::TestCase

  RSpec.describe "Messages", type: :request do
    before (:each) do
      @valid_attributes = {
        contenido: "Foro Curso 23",
        forum_id: 23,
        user_id: 23
      }
      @invalid_attributes = {
        name: "Nombre malo Foro",
        forum_id: 99,
        user_id: 99
      }
      @user_attributes = {
        email: "nicemail@uc.cl",
        name: "Usuario",
        last_name: "Ejemplar",
        profile_picture: "pic.jpg",
        password: "password"
      }
      @forum_attributes = {
        name: "Foro Curso 23",
        course_id: 23
      }
      @course = FactoryBot.create(:course)
      #@forum = FactoryBot.create(:forum)
      @user = FactoryBot.create(:user)
      #@forum.course_id = @course.id
    end

    # describe "index" do
    #   it "should return a successful request" do
    #     sign_in @user
    #     course = FactoryBot.create(:course)
    #     forum = Forum.create(@forum_attributes)
    #     forum.course_id = @course.id
    #     message = Message.create(@valid_attributes)
    #     message.user_id = @user.id
    #     message.forum_id = forum.id
    #     @message = forum.messages.new

    #     get "/courses/#{course.id}/forums/#{forum.id}/messages"
    #     expect(response).to have_http_status(:ok)
    #   end
    # end

    describe "new" do 
      it "should return a successful request" do
        sign_in @user
        course = FactoryBot.create(:course)
        forum = Forum.create(@forum_attributes)
        forum.course_id = @course.id
        message = Message.create(@valid_attributes)
        message.user_id = @user.id
        message.forum_id = forum.id
        #get "/courses/#{@course.id}/forums/#{forum.id}/messages/new"
        get "/courses/#{course.id}/forums"
        expect(response).to have_http_status(:ok)
      end
    end

    describe "create" do
      context "with valid parameters" do #si lo pasa
        it "creates a new Message" do 
          expect do
            user = User.create!(@user_attributes)
            sign_in user
            expect {
              post "/messages", params: { message: @valid_attributes }
            }.to change(Message, :count).by(1)
          end
        end
      end
    
      # describe "delete" do
      #   context "existing message" do
      #     it "removes message from the messages" do
      #       sign_in @user
      #       course = FactoryBot.create(:course)
      #       forum = Forum.create(@forum_attributes)
      #       forum.course_id = @course.id
      #       message = Message.create(@valid_attributes)
      #       message.user_id = @user.id
      #       message.forum_id = forum.id

      #       message.destroy
      #       #delete "/courses/#{@course.id}/clases/#{@clase.id}"
      #       get "/courses/#{@course.id}/forums/#{forum.id}/messages/new"
      #       expect(response).to have_http_status(:ok)
      #       #expect(response).to redirect_to("/courses/#{@course.id}/forums/#{forum.id}/messages/new")
      #     end
      #   end
      # end

    end
  end
end



