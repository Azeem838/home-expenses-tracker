require 'rails_helper'

RSpec.describe Group, type: :model do
  before { FactoryBot.build(:group) }
  before { FactoryBot.create(:user) }

  describe 'validations' do
    it 'should be invalid' do
      expect(FactoryBot.build(:group, name: nil)).not_to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
  end

  describe 'associations' do
    it { should have_many(:expense_groups).dependent(:destroy) }
    it { should have_many(:expenses) }
    it { should belong_to(:user) }
  end

  context 'validates image' do
    before(:each) do
      @group = create(:group)
    end

    it 'is valid with image greater than 1mb' do
      @group.main_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'less-than-1mb.jpg')),
        filename: 'greater-than-1mb.jpg',
        content_type: 'application/xlsx'
      )
      expect(@group.valid?).to be true
    end

    it 'is invalid with image greater than 1mb' do
      @group.main_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'greater-than-1mb.jpg')),
        filename: 'greater-than-1mb.jpg',
        content_type: 'application/xlsx'
      )
      expect(@group.valid?).to be false
    end

    it 'is invalid with incorrect file format' do
      @group.main_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'invalid-file-format.gif')),
        filename: 'greater-than-1mb.jpg',
        content_type: 'application/xlsx'
      )
      expect(@group.valid?).to be false
    end
  end
end
