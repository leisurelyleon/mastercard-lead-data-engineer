# File: user_management.sh
#!/bin/bash

# User account management utility
# Usage: ./user_management.sh {create|delete|list} [username]

COMMAND="${1:-}"
USERNAME="${2:-}"

show_usage() {
  echo "Usage: $0 {create|delete|list} [username]"
  exit 1
}

case "$COMMAND" in
  create)
    if id "$USERNAME" &>/dev/null; then
      echo "User '$USERNAME' already exists."
    else
      sudo useradd -m "$USERNAME"
      echo "User '$USERNAME' created."
    fi
    ;;

  delete)
    if id "$USERNAME" &>/dev/null; then
      sudo userdel -r "$USERNAME"
      echo "User '$USERNAME' deleted."
    else
      echo "User '$USERNAME' does not exist."
    fi
    ;;

  list)
    echo "Existing system users:"
    cut -d: -f1 /etc/passwd
    ;;

  *)
    show_usage
    ;;
esac

exit 0
