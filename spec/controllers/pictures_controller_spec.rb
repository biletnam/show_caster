require 'rails_helper'


RSpec.describe PicturesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Picture. As you add validations to Picture, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # PicturesController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "returns a success response" do
  #     Picture.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns a success response" do
  #     picture = Picture.create! valid_attributes
  #     get :show, params: { id: picture.to_param }, session: valid_session
  #     expect(response).to be_success
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns a success response" do
  #     picture = Picture.create! valid_attributes
  #     get :edit, params: { id: picture.to_param }, session: valid_session
  #     expect(response).to be_success
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Picture" do
  #       expect {
  #         post :create, params: { picture: valid_attributes }, session: valid_session
  #       }.to change(Picture, :count).by(1)
  #     end
  #
  #     it "redirects to the created picture" do
  #       post :create, params: { picture: valid_attributes }, session: valid_session
  #       expect(response).to redirect_to(Picture.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: { picture: invalid_attributes }, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested picture" do
  #       picture = Picture.create! valid_attributes
  #       put :update, params: { id: picture.to_param, picture: new_attributes }, session: valid_session
  #       picture.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the picture" do
  #       picture = Picture.create! valid_attributes
  #       put :update, params: { id: picture.to_param, picture: valid_attributes }, session: valid_session
  #       expect(response).to redirect_to(picture)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       picture = Picture.create! valid_attributes
  #       put :update, params: { id: picture.to_param, picture: invalid_attributes }, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested picture" do
  #     picture = Picture.create! valid_attributes
  #     expect {
  #       delete :destroy, params: { id: picture.to_param }, session: valid_session
  #     }.to change(Picture, :count).by(-1)
  #   end
  #
  #   it "redirects to the pictures list" do
  #     picture = Picture.create! valid_attributes
  #     delete :destroy, params: { id: picture.to_param }, session: valid_session
  #     expect(response).to redirect_to(pictures_url)
  #   end
  # end

end
