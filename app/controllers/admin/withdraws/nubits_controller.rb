module Admin
  module Withdraws
    class NubitsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Nubit'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_nubits = @nubits.with_aasm_state(:accepted).order("id DESC")
        @all_nubits = @nubits.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @nubit.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @nubit.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
