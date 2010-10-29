class ContactUsAbilityDecorator
  include CanCan::Ability

  def initialize(user)
    can :read, Inquiry
    can :index, Inquiry
    can :create, Inquiry
  end
end