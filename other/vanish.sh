if [[ "$1" != "--yes-i-will-delete-everything" || "$2" != "--i-am-sure" ]]; then
    echo "Use: $0 --yes-i-will-delete-everything --i-am-sure"
    exit 1
fi

docker rm -vf $(docker ps -aq) 2> /dev/null

docker rmi -f $(docker images -aq) 2> /dev/null

rm -rf /infra
