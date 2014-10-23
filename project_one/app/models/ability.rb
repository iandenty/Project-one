class Ability
  include CanCan::Ability

  def initialize(player)
    user ||= Player.new
    if player.role? :admin
      can :manage, :all
    else
      can :read, Player
    end
  end
end
