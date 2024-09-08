echo

docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"
echo

docker system df
echo

du -h -d 1 /infra
echo

df -h | grep -v '^overlay' | awk 'NR==1 || ($NF!~/^\/var\/lib\/docker/ && $NF!~/^\/var\/lib\/docker\/overlay2/)'
echo
