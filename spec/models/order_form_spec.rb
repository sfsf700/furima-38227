require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
      sleep(1)
    end



    context '商品購入できる場合' do
      it "全ての項目が存在すれば登録できる" do
        expect(@order_form).to be_valid
      end
      it "郵便番号は3桁の数字+ハイフン+4桁の数字であれば保存できる" do
        @order_form.postal_code = '987-6543'
        expect(@order_form).to be_valid
      end
      it "建物名は空でも登録できる" do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
      it "都道府県が---以外であれば登録できる" do
        @order_form.area_id = 3
        expect(@order_form).to be_valid
      end
    end

    context '商品購入できない場合' do
      it "tokenが空では保存できない" do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
      it "郵便番号が空では保存できない" do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
      it "郵便番号にハイフンがなければ保存できない" do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
      it "都道府県が---では保存できない" do
        @order_form.area_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end 
      it "市区町村が空では保存できない" do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
      it "番地が空では保存できない" do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
      it "電話番号が空では保存できない" do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
      it "電話番号は半角数字でなければ保存できない" do
        @order_form.phone_number = '０９０２３４５６７８９'
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
      it "電話番号にハイフンがあると保存できない" do
        @order_form.phone_number = '090-0000-0000'
        @order_form.valid?
        expect(@order_form.errors.full_messages)
      end
    end
  end
end