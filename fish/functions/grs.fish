function grs --wraps='git restore --staged'
    if not set -q argv[1]
        echo 'git restore --staged .'
        command git restore --staged .
    else
        echo "git restore --staged $argv"
        command git restore --staged $argv
    end
end
