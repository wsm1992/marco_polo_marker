module GameHelper

  def player_info(player)
    concat label_tag("user", player.user.name)
    concat label_tag("role", "(#{player.role.name})")
    style = player.is_last_traveller ? 'bold' : 'normal'
    concat label_tag("score", "  #{player.score}", style: "font-weight:#{style}")
  end
end
