require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "カテゴリーが---以外であれば登録できる" do
        @item.category_id = 3
        expect(@item).to be_valid
      end
      it "商品の状態が---以外であれば登録できる" do
        @item.status_id = 3
        expect(@item).to be_valid
      end
      it "配送料の負担が---以外であれば登録できる" do
        @item.cost_id = 3
        expect(@item).to be_valid
      end
      it "発送元の地域が---以外であれば登録できる" do
        @item.area_id = 3
        expect(@item).to be_valid
      end
      it "発送までの日数が---以外であれば登録できる" do
        @item.days_id = 3
        expect(@item).to be_valid
      end
      it "価格が半角数字かつ、300円~9,999,999円の間であれば登録できる" do
        @item.price = 1234567
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it "商品名が空では保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品画像が空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品の説明が空では保存できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが---では保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が---では保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担が---では保存できない" do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it "発送元の地域が---では保存できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "発送までの日数が---では保存できない" do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it "価格が空では保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300円未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が10,000,000円以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.price = 'ゴールド'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end