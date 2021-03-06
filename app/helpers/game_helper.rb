module GameHelper

  def player_info(player)
    concat label_tag("user", player.user.name)
    concat label_tag("role", "(#{player.role.name})")
    bold_style = player.is_last_traveller ? 'bold' : 'normal'
    underline_style = player.is_first_mover ? 'underline' : 'normal'
    pick_style = player.is_first_picker ? '*' : ''
    concat label_tag("score", "  #{player.score}#{pick_style}", style: "font-weight:#{bold_style}; text-decoration:#{underline_style}")
  end
end
