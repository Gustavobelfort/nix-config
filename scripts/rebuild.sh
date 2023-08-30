set -e

while true; do
    echo "Which device do you want to rebuild?"
    echo "1. laptop"
    read -p  $'\e[1;32mEnter your choice(number): \e[0m' -r device

    case $device in
        1)
            doas nixos-rebuild switch --flake .#laptop;
            break ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
