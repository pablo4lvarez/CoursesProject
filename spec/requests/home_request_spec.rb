require 'rails_helper'
require 'faker'

class HomeTest < ActiveSupport::TestCase

    RSpec.describe "Home", type: :request do


        describe "index" do
            it "should return a succesfull request" do
                get "/home"
                expect(response).to have_http_status(:ok)
            end
        end
    end
end