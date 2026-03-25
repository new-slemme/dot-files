function do-vpn --wraps='sudo openvpn --config ~/Downloads/t.dahlem@mtx.int__ssl_vpn_config.ovpn' --description 'alias do-vpn=sudo openvpn --config ~/Downloads/t.dahlem@mtx.int__ssl_vpn_config.ovpn'
  sudo openvpn --config ~/Downloads/t.dahlem@mtx.int__ssl_vpn_config.ovpn $argv; 
end
