module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      return unless user.admin?

      can :read, Order
      can :read, Trade
      can :read, Proof
      can :update, Proof
      can :manage, Document
      can :manage, Member
      can :manage, Ticket
      can :manage, IdDocument
      can :manage, TwoFactor

      can :menu, Deposit
      can :manage, ::Deposits::Dollar
      can :manage, ::Deposits::Satoshi
      can :manage, ::Deposits::Nubit
      can :manage, ::Deposits::Euro

      can :menu, Withdraw
      can :manage, ::Withdraws::Dollar
      can :manage, ::Withdraws::Satoshi
      can :manage, ::Withdraws::Nubit
      can :manage, ::Withdraws::Eur
    end
  end
end
