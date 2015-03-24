module Private::Withdraws
  class DollarsController < ::Private::Withdraws::BaseController
    include ::Withdraws::CtrlBankable
  end
end
