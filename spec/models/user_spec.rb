require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:favourites) }
  it { should have_many(:favourite_albums).through(:favourites).source(:album) }

  it "can have multiple favourite albums" do
    user = create(:user)
    album1 = create(:album)
    album2 = create(:album)

    user.favourite_albums << album1
    user.favourite_albums << album2

    expect(user.favourite_albums).to include(album1, album2)
  end
end