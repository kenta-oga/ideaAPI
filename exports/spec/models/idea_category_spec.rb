require 'rails_helper'

RSpec.describe IdeaCategory, type: :model do
  before do
    @idea_category = FactoryBot.build(:idea_category)
  end

  describe 'カテゴリー・アイデア登録' do
    context '登録できる場合' do
      it 'カテゴリー名と本文があれば登録される' do
        expect(@idea_category).to be_valid
      end
      it '重複したカテゴリー名が存在する場合でも登録できる' do
        @idea_category.save
        another_idea_category = FactoryBot.build(:idea_category)
        another_idea_category.name = @idea_category.name
        expect(@idea_category).to be_valid
      end
    end
    context '登録できない場合' do
      it '本文が空だと登録できない' do
        @idea_category.body = ''
        @idea_category.valid?
        expect(@idea_category.errors.full_messages).to include("Body can't be blank")
      end
      it 'カテゴリー名が空だと登録できない' do
        @idea_category.name = ''
        @idea_category.valid?
        expect(@idea_category.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
