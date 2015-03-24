module Private
  module Deposits
    class NubitsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
