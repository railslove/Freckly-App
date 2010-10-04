require 'spec_helper'

describe DashboardController do
  describe "GET #index" do
    describe "response" do
      before { get :index }
      subject { response }

      it { should be_success }
    end
  end
end