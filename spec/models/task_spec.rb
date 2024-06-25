# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task do
  describe "#validate" do
    context "全ての属性が正しい場合" do
      let!(:task) { build(:task) }

      it "インスタンスが有効である", :aggregate_failures do
        expect(task).to be_valid
        expect(task.errors).to be_empty
      end
    end

    context "正しくない属性が含まれる場合" do
      context "nameがnilの場合" do
        let!(:task) { build(:task, name: nil) }

        it "インスタンスが無効である", :aggregate_failures do
          expect(task).not_to be_valid
          expect(task.errors[:name]).to include("can't be blank")
        end
      end

      context "nameが空文字の場合" do
        let!(:task) { build(:task, name: "") }

        it "インスタンスが無効である", :aggregate_failures do
          expect(task).not_to be_valid
          expect(task.errors[:name]).to include("can't be blank")
        end
      end

      context "nameが101文字以上の場合" do
        let!(:task) { build(:task, name: "a" * 101) }

        it "インスタンスが無効である", :aggregate_failures do
          expect(task).not_to be_valid
          expect(task.errors[:name]).to include("is too long (maximum is 100 characters)")
        end
      end

      context "statusがnilの場合" do
        let!(:task) { build(:task, status: nil) }

        it "インスタンスが無効である", :aggregate_failures do
          expect(task).not_to be_valid
          expect(task.errors[:status]).to include("is not included in the list")
        end
      end

      context "statusが不正な値の場合" do
        let!(:task) { build(:task, status: 3) }

        it "インスタンスが無効である", :aggregate_failures do
          expect(task).not_to be_valid
          expect(task.errors[:status]).to include("is not included in the list")
        end
      end
    end
  end
end
