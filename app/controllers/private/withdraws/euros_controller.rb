module Private::Withdraws
  class EurosController < ::Private::Withdraws::BaseController
    include ::Withdraws::CtrlBankable
  end
end
