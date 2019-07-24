require "rails_helper"

RSpec.describe Supervisors::CoursesController, type: :controller do
  let(:course) {FactoryBot.create :course}
  let(:subject) {FactoryBot.create :subject}

  describe "GET #index" do
    context "when redirect to #index action" do
      before{ get :index}
      it{expect(response).to render_template :index}
    end
  end

  describe "GET #new" do
    context "when redirect to new Course" do
      before{get :new}
      it{expect(response).to render_template :new}
    end
  end


  describe "POST #create" do
    before{subject.save}
    context "when valid attribute" do
      it do
        post :create, params: {course: FactoryBot.attributes_for(:course)}

        # expect(flash[:success]).to eql I18n.t "messages.save_success"
        expect(response).to redirect_to supervisors_courses_path
      end
    end
  end

  # describe "POST #create" do
  #   context "when valid attributes" do
  #     it do
  #       post :create, params: {product: FactoryBot.attributes_for(:product), item_photos: {:photo => ["photo"]}}
  #       expect(assigns(:admin_product)).to be_a Product
  #       expect(flash[:info]).to eql I18n.t "helpers.success[added_product]"
  #       expect(response).to redirect_to admin_products_path
  #     end
  #   end
  #
  #   context "when invalid attributes" do
  #     it do
  #       post :create, params: {product: invalid_params}
  #       expect(response).to render_template :new
  #     end
  #   end
  # end




  # describe "GET #edit" do
  #   context "when redirect to edit action" do
  #     before{get :edit, params:{id: course.id}}
  #     it do
  #       debugger
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end
end
