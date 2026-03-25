function pop-utils
		set -l hosts
	if count $argv > 0
		set hosts $argv[1]
	else
		for file in ~/.ssh/config.d/*
			if test -f $file
				set -l file_hostnames (grep -E "^\s*Host\s+" $file | awk '{print $2}')
				for host in $file_hostnames
					set hosts $hosts $host
				end
		end
	end
end
for i in (seq 1 (count $hosts))
	echo "$i) $hosts[$i]"
	rsync -av ~/.config/neofetch/config2.conf $hosts[$i]:~/.config/neofetch/config.conf --delete
	rsync -av ~/.config/fish/functions/* --exclude ~/.config/fish/functions/fish_greeting.fish $hosts[$i]:~/.config/fish/functions/ --delete
	rsync -av ~/.config/fish/functions/fish_greeting.fish.ssh $hosts[$i]:~/.config/fish/functions/fish_greeting.fish --delete
        rsync -av ~/.config/starship.toml $hosts[$i]:~/.config/
end
end
