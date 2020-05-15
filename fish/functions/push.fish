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
        case "*"
            echo "GOTCHA!"
    end
end

