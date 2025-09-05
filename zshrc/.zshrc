# kill-port shortcut 
# To use: kill-port 9090
killport() {
  if [ -z "$1" ]; then
    echo "Error: killport() <port> requires a port number"
    return 1
  fi
  
  pid=$(lsof -ti:$1)

  if [ -z "$pid" ]; then
    echo "No process found on port $1"
    return 1
  fi

  kill -9 $pid
  echo "Killed process on port $1 (PID: $pid)"
}

# update-fork shortcut 
# To use: update-fork
# Prerequisite. You must have the origin and upstream remotes added like this:
# git remote add origin <FORK_GIT_URL>
# git remote add upstream <UPSTREAM_GIT_URL> 
update-fork() {
    git switch main
    git fetch upstream
    git merge upstream/main
    git push origin main
}
