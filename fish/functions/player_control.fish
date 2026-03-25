function player_control
end

function wait_for_player
    for i in (seq 20)
        set player_status (playerctl status 2>/dev/null)
        if test "$player_status" = "Playing" -o "$player_status" = "Paused"
            return 0
        end
        sleep 0.1
    end
    return 1
end

function pcw
    wait_for_player
    set url (playerctl metadata mpris:artUrl 2>/dev/null)

    # Clean thumbnail cache
    if test -d ~/.cache/thumbnails/neofetch
        rm -f ~/.cache/thumbnails/neofetch/*
    end

    # Get art
    if test -n "$url"
        curl -sk "$url" -o ~/art.jpg
    end

    if test -s ~/art.jpg
        neofetch
    else
        cp -f (random choice ~/Bilder/neofetch/*) ~/art.jpg
        neofetch
        rm ~/art.jpg
    end
end

function pch
	clear
	playerctl play-pause
	pcw
end

function pcl
	playerctl loop $argv[1]
end

function pcn
	clear
	rm ~/art.jpg
	playerctl next
	pcw
end

function pcp
	clear
	rm ~/art.jpg
	playerctl previous
	pcw
end

function pcv
	playerctl volume $argv[1]
end
