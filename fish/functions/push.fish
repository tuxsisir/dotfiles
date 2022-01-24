function push
    switch $argv
        case wiki
            cd ~/vimwiki/
            git status
            git add .
            git commit -m "Update wiki"
            git push origin master
        case dots
            cd ~/mydots/
            git status
            git add .
            git commit -m "Update dots"
            git push origin master
        case tux
            cd ~/projects/tuxnuxt
            git status
            git add .
            git commit -m "Push updates"
            git push origin
        case "*"
            echo "Please select from case:"
    end
end

