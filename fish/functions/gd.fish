function gd
    switch $argv
        case schoolapp
            cd ~/projects/dockerized/school-app/schoolapp/
        case logapp
            cd ~/projects/dockerized/logapp/backend/logapp
        case docker
            cd ~/projects/docker/
        case wiki
            cd ~/vimwiki/
        case nvim
            cd ~/.config/nvim/
        case fish
            cd ~/dotfiles/fish/functions
        case dots
            cd ~/dotfiles/
        case fuse
            cd ~/projects/fuse-machines/
        case codehub
            cd ~/projects/fuse-machines/fuse-jupyterhub
        case cc
            cd ~/projects/fuse-machines/codehub-customize/local-codehub/
        case "*"
            echo "GOTCHA!"
    end
end

