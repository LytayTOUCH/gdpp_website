require 'rails_helper'
include ControllerHelpers

RSpec.describe FaqsController, type: :controller do
  login_admin

  describe "GET #FaqController" do
    context '#index' do
      it "populates an array of Faq" do
        faq_one = create(:faq, question: 'Question 1', answer: 'Answer 1')
        faq_two = create(:faq, question: 'Question 2', answer: 'Answer 2')
        get :index
        expect(assigns(:faqs)).to match_array([faq_one, faq_two])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "#new" do
      it "assigns a new Faq to @faq" do
        get :new
        expect(assigns(:faq)).to be_a_new(Faq)
      end
      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    context "#edit" do
      it "assigns the requested an Faq to @faq" do
        faq = create(:faq)
        get :edit, id: faq
        expect(assigns(:faq)).to eq(faq)
      end
      it "renders the :edit template" do
        faq = create(:faq)
        get :edit, id: faq
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new Faq in the database" do
        expect{ 
          post :create, faq: attributes_for(:faq)
        }.to change(Faq, :count).by(1)
      end

      it "redirects to Faqs#index" do
        post :create, faq: attributes_for(:faq)
        expect(response).to redirect_to faqs_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new Faq in the database" do
        expect{
          post :create, faq: attributes_for(:invalid_faq)
        }.to_not change(Faq, :count)
      end

      it "re-renders the :new template" do
        post :create, faq: attributes_for(:invalid_faq)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @faq = FactoryGirl.create(:faq, question: "Q1", answer: "A1")
    end

    it "locates the requested @faq" do
      put :update, id: @faq, 
      faq: FactoryGirl.attributes_for(:faq)
      expect(assigns(:faq)).to eq(@faq)
    end

    context "with valid attributes" do
      it "changes @faq's attributes" do
        put :update, id: @faq, faq: FactoryGirl.attributes_for(:faq, question: "Change to Q2", answer: "A1")
        @faq.reload
        expect(@faq.question).to eq("Change to Q2")
      end
      it "redirects to the updated Faq" do
        put :update, id: @faq, faq: FactoryGirl.attributes_for(:faq)
        expect(response).to redirect_to faqs_path
      end
    end

    context "with invalid attributes" do
      it "does not change @faq's attributes" do
        put :update, id: @faq, 
        faq: FactoryGirl.attributes_for(:faq, question: nil, answer: "A1")
        @faq.reload
        expect(@faq.question).to eq("Q1")
      end
      it "re-renders the edit method" do
        put :update, id: @faq, faq: FactoryGirl.attributes_for(:invalid_faq)
        expect(response).to render_template :edit
      end
    end
  end


end
