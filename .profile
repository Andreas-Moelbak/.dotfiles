platform="$(uname -s)"
case "${platform}" in
    Linux*)     machine=Linux;;
    Darwin*)     machine=Darwin;;
esac

if [[ machine == "Linux" ]]; then
    export PATH=$HOME/.local/bin:$PATH
    set s off.
    xset -dpms
    xset s noblank
fi
