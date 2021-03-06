require 'rails_helper'
# require 'vcr'

RSpec.describe "Coachs", type: :request do
   let (:valid_attributes) {
         {
           firstname: "eric",
           lastname: "bicon",
           email: "gogo@lele.fr",
           cell_phone_nr: "0163456789",
           note: "my note"
         }
       }
   let (:new_valid_attributes) {
         {
           firstname: "Gelle",
           lastname: "Lieffer",
           email: "gaga@lele.fr",
           cell_phone_nr: "0123488789",
           note: "my note"
         }
       }
   let (:invalid_attributes) {
         {
           lastname: "bicon",
           email: "gogo@lelefr",
           cell_phone_nr: "0123456789",
           note: "my note"
         }
       }
  context "As logged as admin," do

    describe "GET #index" do
      before :each do
        request_log_in_admin
      end
      it "renders coaches index" do
        get '/coaches/new'
        expect(response).to render_template(:new)
      end
    end
    describe "NEW" do
      before :each do
        request_log_in_admin
      end
      it "builds a new Coach" do
        coach = Coach.new valid_attributes
        expect(coach).to be_valid
        post '/coaches', params: { coach: valid_attributes }
        expect(response).to redirect_to coaches_path
      end
    end
    describe "EDIT" do
      it "builds edits Coach" do
        admin = create(:user, :admin, :registered)
        coach = create(:coach)
        request_log_in(admin)
        get edit_coach_path(coach)
        expect(response).to render_template :edit
      end
    end
    describe "POST #create" do
      context "with valid params" do
        before :each do
          request_log_in_admin
        end
        it "creates a new Coach" do
          coach = Coach.new valid_attributes
          expect(coach).to be_valid
          post '/coaches', params: { coach: valid_attributes }
          expect(response).to redirect_to coaches_path
        end
      end
      context "with invalid params" do
        before :each do
          request_log_in_admin
        end
        it "fails to create a new Coach" do
          coach = Coach.new invalid_attributes
          expect(coach).not_to be_valid
          post '/coaches', params: { coach: invalid_attributes }
          expect(response).to render_template(:new)
        end
      end
    end
    describe "UPDATE" do
      context "with valid params" do
        before :each do
          @admin = create(:user, :admin, :setup)
          request_log_in @admin
        end
        it "is ok" do
          coach = create(:coach)
          @url = "/coaches/#{ coach.id }"
          put @url, params: { id: coach.id, coach: new_valid_attributes }
          expect(response).to redirect_to coaches_path
        end
      end
      context "with invalid params" do
        before :each do
          @admin = create(:user, :admin, :setup)
          request_log_in @admin
        end
        it "fails to update coach" do
          coach = create(:coach)
          @url = "/coaches/#{ coach.id }"
          put @url, params: { id: coach.id, coach: invalid_attributes }
          expect(response).to render_template(:edit)
        end
      end
    end
  end
 end
