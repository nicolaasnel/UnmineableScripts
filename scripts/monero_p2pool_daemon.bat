echo "Waiting to start P2Pool"
timeout 240
%p2pool_daemon% %p2pool_daemon_options%
exit 0;
