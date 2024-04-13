function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold $fish_color_command
      echo 'N '
    case insert
      set_color --bold $fish_color_quote 
      echo 'I '
    case replace_one
      set_color --bold $fish_color_keyword
      echo 'R ' 
    case visual
      set_color --bold $fish_color_redirection
      echo 'V '
    case '*'
      set_color --bold $fish_color_normal 
      echo '? '
  end
  set_color $fish_color_normal
end

