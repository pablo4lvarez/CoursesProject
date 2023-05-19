require 'rails_helper'
require 'faker'

class CourseTest < ActiveSupport::TestCase

    RSpec.describe "Courses", type: :request do
        before(:each) do

            @valid_attributes = {
                name: "Nombre",
                description: "Descripción",
                category: "Caregoria"
            }

            @invalid_attributes = {
                name: "Nombre malo",
                description: "Descripción mala",
                category: "Categoria mala"
            }

            @user_attributes = {
                email: "nicemail@uc.cl",
                name: "Usuario",
                last_name: "Ejemplar",
                profile_picture: "pic.jpg",
                password: "password"
            }
            @course = FactoryBot.create(:course)
        end

        # Course. As you add validations to Course, be sure to
        # adjust the attributes here as well.
        # let(:user) {create(:user)}
        # let(:course) {create(:course)}

        describe "index" do 
            it "should return a successful request" do 
                get "/courses"
                expect(response).to have_http_status(:ok)
            end
        end

        describe "new" do 
            it "should return a successful request" do 
                user = User.create(@user_attributes)
                sign_in user
                get "/courses/new"
                expect(response).to have_http_status(:ok)
            end
        end

        describe "show" do
            it "should return a successful request" do
                user = User.create(@user_attributes)
                sign_in user
                get "/courses/#{@course.id}"
                expect(response).to have_http_status(:ok)
            end
        end

        describe "edit" do
            it "should return a successfull request" do
                user = User.create(@user_attributes)
                sign_in user
                get "/courses/#{@course.id}/edit"
                expect(response).to have_http_status(:ok)
            end
        end

        describe "create" do
            context "with valid parameters" do
                it "creates a new Course" do
                    expect do
                        user = User.create!(@user_attributes)
                        sign_in user
                        expect {
                            post "/courses", params: { course: @valid_attributes }
                        }.to change(Course, :count).by(1)
                    end
                end

                it "redirects to courses index" do
                    user = User.create!(@user_attributes)
                    sign_in user
                    post courses_url, params: { course: @valid_attributes }
                    expect(response).to redirect_to(root_path)
                end
            end

            context "with invalid parameters" do

                it "renders a not successful response (i.e. to display the 'new' template)" do
                    user = User.create!(@user_attributes)
                    sign_in user
                    post courses_url, params: { course: @invalid_attributes }
                    expect(response).not_to be_successful
                end

                it "redirects to new_course_path" do
                    user = User.create!(@user_attributes)
                    sign_in user
                    post courses_url, params: { course: @valid_attributes }
                    expect(response).not_to redirect_to(new_course_path)
                end
            end
        end


        describe "update" do
            before do
                @new_attributes = {
                    name: "Nombre nuevo",
                    description: "Descripción nueva",
                    category: "Categoria nueva"
                }
            end

            context "with valid parameters" do
                let(:new_attributes) {
                    name { Faker::Educator.course_name }
                    description { Faker::Lorem.sentence }
                    category { Faker::Educator.subject }
                }

                it "updates the requested course" do
                    course = Course.create!(@valid_attributes)
                    patch course_url(course), params: { course: @new_attributes }
                    course.reload
                end

                it "redirects to courses index" do
                    course = Course.create! @valid_attributes
                    patch course_url(course), params: { course: @new_attributes }
                    course.reload
                    expect(response).to redirect_to(course_path)
                end
            end

            context "with invalid parameters" do
                it "renders a successful response (i.e. to display the 'edit' template)" do
                    course = Course.create! @valid_attributes
                    patch course_url(course), params: { course: @invalid_attributes }
                    expect(response).not_to be_successful
                end
            end
        end

        describe "delete" do
            context "existing course" do
                it "removes course from the courses" do
                    delete "/courses/#{@course.id}"
                    expect(response).to redirect_to("/")
                end
            end
        end

    end
end
