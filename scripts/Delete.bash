#!/usr/bin/env bash

cd "$HOME/.config" || exit 1

if [ ! -d "./Rices" ]; then
echo "No ~/.config/Rices directory found."
exit
fi

echo "This will remove symlinks in ~/.config pointing to Rices:"

for f in *; do
[ -L "$f" ] || continue

```
case "$(readlink "$f")" in
    *"/.config/Rices/"*)
        echo "  $f"
        ;;
esac
```

done

echo -n "Do you want to continue? [y/n]: "
read ans
[[ $ans != "y" && $ans != "Y" ]] && exit

for f in *; do
[ -L "$f" ] || continue

```
case "$(readlink "$f")" in
    *"/.config/Rices/"*)
        unlink "$f"
        echo "Unlinked $f"
        ;;
esac
```

done

echo "Done."

