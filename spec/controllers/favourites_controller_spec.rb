require 'rails_helper'

RSpec.describe FavouritesController, type: :controller do
  let(:user) { create(:user)}
  let(:album) { create(:album)}

  before do
    sign_in user
  end

  describe "POST #create" do
    it "creates a new favourite for the album" do
      expect {
        post :create, params: { album_id: album.id}
    }.to change(user.favourite_albums, :count).by(1)

    expect(user.favourite_albums).to include(album)
    expect(response).to redirect_to(album_path(album))
    expect(flash[:notice]).to eq("Album added to favourites.")
    end
  end

  describe "DELETE #destroy" do
    before do
      user.favourite_albums << album
    end

    it "removes the album from the user's favourites" do
      expect {
        delete :destroy, params: { album_id: album.id }
      }.to change(user.favourite_albums, :count).by(-1)
      
      expect(user.favourite_albums).not_to include(album)
      expect(response).to redirect_to(album_path(album))
      expect(flash[:notice]).to eq("Album removed from favourites.")
    end
  end
end