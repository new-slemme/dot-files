function read_with_timeout
    python3 -c 'import sys; import select; rlist, _, _ = select.select([sys.stdin], [], [], 1); print(sys.stdin.readline().strip() if rlist else "")'
end


function watch_player

set initialize "0"

if test $initialize -eq 0
	set initialze 1
	pcw
end

# Initialize previous_title to an empty string
set previous_title (playerctl metadata title)

# Main loop to continuously monitor for changes in the currently playing song
while true

    # Extract the title of the currently playing song
    set current_title (playerctl metadata title)

    # Check if the title has changed since the last check
    if test "$current_title" != "$previous_title"
        
	# If the title has changed, execute neofetch
        pcw

        # Update the previous title to the current title for the next iteration
        set previous_title $current_title
    end
    
    #read -l test

    eval (read_with_timeout)

end


end

