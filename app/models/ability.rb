# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    # if user.present?  
    #   can :read, Article, user_id: user.id
    #   can :update,Article,user_id: user.id
    # end
    user ||= User.new
    if user.present?
      can :manage, Article , user_id: user.id
      can :read, :all
    end
  end
end
