module Private
  class AssetsController < BaseController
    skip_before_action :auth_member!, only: [:index]

    def index
      @usd_assets  = Currency.assets('usd')
      @eur_assets  = Currency.assets('eur')
      @btc_proof   = Proof.current :btc
      @usd_proof   = Proof.current :usd
      @nbt_proof   = Proof.current :nbt
      @eur_proof   = Proof.current :eur

      if current_user
        @btc_account = current_user.accounts.with_currency(:btc).first
        @usd_account = current_user.accounts.with_currency(:usd).first
        @nbt_account = current_user.accounts.with_currency(:nbt).first
        @eur_account = current_user.accounts.with_currency(:eur).first
      end
    end

    def partial_tree
      account    = current_user.accounts.with_currency(params[:id]).first
      @timestamp = Proof.with_currency(params[:id]).last.timestamp
      @json      = account.partial_tree.to_json.html_safe
      respond_to do |format|
        format.js
      end
    end

  end
end
