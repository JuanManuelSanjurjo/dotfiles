if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Custom fish_prompt
function fish_prompt
    set_color brred -o  
    echo -n "WSL2"
    set_color brgreen
    echo -n "@/"(whoami) 
    set_color brcyan
    echo -n " ->" (basename (pwd)) "# " 
    set_color normal
end
