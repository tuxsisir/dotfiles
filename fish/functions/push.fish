function push
    switch $argv
        case wiki
            cd ~/projects/vimwiki/
            git status
            git add .
            git commit -m "Update wiki"
            git push origin master
        case "*"
            echo "GOTCHA!"
    end
end

