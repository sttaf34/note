
# findで得られた複数行の結果の各行をwcに渡す
find ~/Projects/dotfiles -name '*.json' | xargs wc -l
