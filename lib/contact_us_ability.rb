class ContactUsAbility
  include CanCan::Ability

  def initialize(user)
    can :read,   Spree::Inquiry
    can :index,  Spree::Inquiry
    can :create, Spree::Inquiry
  end
end