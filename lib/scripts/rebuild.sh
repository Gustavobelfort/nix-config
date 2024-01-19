set -e

if command -v doas &> /dev/null; then
    CMD=doas
else
    CMD=sudo
fi

while true; do
    echo "Which device do you want to rebuild?"
    echo "1. elysium"
    echo "2. minimal"
    read -p  $'\e[1;32mEnter your choice(number): \e[0m' -r device

    case $device in
        1)
            $CMD  nixos-rebuild switch --flake .#elysium;
            break ;;
        2)
            $CMD  nixos-rebuild switch --flake .#minimal;
            break ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
