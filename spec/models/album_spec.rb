require'rails_helper'

RSpec.describe Album, type: :model do
  it { should have_many(:favourites) }
  it { should have_many(:favourited_by).through(:favourites).source(:user) }

  it "can be favourited by multiple users" do
    user1 = create(:user)
    user2 = create(:user, email: "testemail2@gmail.com")
    album = create(:album)

    user1.favourite_albums << album
    user2.favourite_albums << album

    expect(album.favourited_by).to include(user1, user2)
  end

end