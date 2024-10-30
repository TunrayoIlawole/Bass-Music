require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  let(:user) { create(:user)}
  let(:album) { create(:album)}

  before do
    assign(:album, album)
    assign(:tracks, album.tracks)
    allow(view).to receive(:current_user).and_return(user)
  end

  context "when the album is not favourited" do
    it "shows the 'Favourite' button" do
      render
      expect(rendered).to have_button("Favourite")
    end
  end

  context "When the album is favourited" do
    before do
      user.favourite_albums << album
    end

    it "shows the 'Unfavourite' button" do
      render
      expect(rendered).to have_button("Unfavourite")
    end
  end
end