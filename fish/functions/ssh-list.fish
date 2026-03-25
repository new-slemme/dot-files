function ssh-list
    set -l hosts
    for file in ~/.ssh/config.d/*
        if test -f $file
#            echo "Processing file: $file"
            set -l file_hostnames (grep -E "^\s*Host\s+" $file | awk '{print $2}')
#            grep -E "^\s*Host\s+" $file | awk '{print $2}'
            for host in $file_hostnames
                set hosts $hosts $host
            end
        end
    end
    for i in (seq 1 (count $hosts))
        echo "$i) $hosts[$i]"
    end

end

function ssh-connect
    set -l hosts
    for file in ~/.ssh/config.d/*
        if test -f $file
#            echo "Processing file: $file"
            set -l file_hostnames (grep -E "^\s*Host\s+" $file | awk '{print $2}')
#            grep -E "^\s*Host\s+" $file | awk '{print $2}'
	    for host in $file_hostnames
                set hosts $hosts $host
            end
        end
    end

    if test (count $hosts) -eq 0
        echo "No HostName found."
        return
    end

    echo "Select a HostName to connect to:"
    for i in (seq 1 (count $hosts))
        echo "$i) $hosts[$i]"
    end

    read -P 'Enter the number of the Host to connect to: ' selection

    if test $selection -ge 1 -a $selection -le (count $hosts)
        set selected_hostname $hosts[$selection]
        echo "Connecting to $selected_hostname..."
        ssh $selected_hostname
    else
        echo "Invalid selection."
    end
end
