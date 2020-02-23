function gd
    switch $argv
        case irhrs
            cd ~/projects/irhrs/
        case projects
            cd ~/projects/
        case irhrs-vue
            cd ~/projects/irhrs/real-hr-soft-frontend/
        case irhrs-nuxt
            cd ~/projects/irhrs/frontend/
        case nvim
            cd ~/.config/nvim/
        case fish
            cd ~/.config/fish/functions
        case "*"
            echo "GOTCHA!"
    end
end

