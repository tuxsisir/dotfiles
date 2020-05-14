function gd
    switch $argv
        case docker
            cd ~/projects/docker/
        case wiki
            cd ~/vimwiki/
        case nvim
            cd ~/.config/nvim/
        case fish
            cd ~/.config/fish/functions
        case dots
            cd ~/mydots/
        case fuse
            cd ~/projects/fuse-machines/
        case codehub
            cd ~/projects/fuse-machines/fuse-jupyterhub
        case codehub-customize
            cd ~/projects/fuse-machines/codehub-customize/local-codehub/
        case "*"
            echo "GOTCHA!"
    end
end

