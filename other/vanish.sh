if [[ "$1" == "--yes-i-will-delete-everything" && "$2" == "--i-am-sure" ]]; then
    echo "Deleting everything..."
else
    echo "Error: Required parameters not provided."
    echo "Usage: $0 --yes-i-will-delete-everything --i-am-sure"
    exit 1
fi

docker rm -vf $(docker ps -aq)

docker rmi -f $(docker images -aq)

rm -rf /infra
