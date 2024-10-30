require'rails_helper'

RSpec.describe Favourite, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:album) }

  it "validates uniqueness of album for each user" do
    user = create(:user)
    album = create(:album)
    create(:favourite, user: user, album: album)

    duplicate_favourite = build(:favourite, user: user, album: album)
    expect(duplicate_favourite).not_to be_valid

  end
end