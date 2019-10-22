require 'rails_helper'

RSpec.describe Users::CommunitiesController do

  FactoryGirl.define do
    factory :user do
      first_name            "Ayush"
      last_name             "Agrawal"
      email                 "a25@gmail.com"
      mobile_no             "9876543121"
      password              "123456"
      password_confirmation "123456"
    end 
  end

  #login_as(User.first)  
  describe "POST create" do

  before do
    #controller.stub(:current_user).and_return(User.first)
    allow(controller).to receive(:current_user).and_return(User.first)
  end

    it "create community" do
      post :create, params: { "community"=>{"name"=>"my"} }
      expect(response).to redirect_to(users_dashboards_path)
    end
  end
end