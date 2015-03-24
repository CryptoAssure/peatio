module Private::Withdraws
  class NubitsController < ::Private::Withdraws::BaseController
    include ::Withdraws::CtrlCoinable
  end
end
