# vim

- See my `.vimrc` [here](https://github.com/8hantanu/dots/blob/main/.vimrc)
- [Vim cheatsheet](https://vim.rtorr.com)

## Commands and Shortcuts

- Ditch vimwiki
  - Generate index.md
  - `<c-r>=glob('**/*')`
  - `:help jumplist`
  - Todo consolidations

- Manage all todos
  - `grep -Ri TODO . > todos`

## Editing Techniques

- `f`: Move forward to character
- `; ,`: Navigate forward and backward
- `d`: Delete
  - `dt_`: Delete till character
  - `di{`: Delete inside braces
  - `da{`: Delete around braces
  - `dip`: Delete paragraph

- Check out relative line number (`:set relativenumber`)

## File Navigation

- `%`: Jump to matching parenthesis
- Fuzzy file find: `:e src/**/file_na<tab>`

## Navigation and Window Management

- `Ctrl + ^`: Switch to last file
- `Ctrl + O/I`: Navigate through jump list
- Bookmarks:
  - `m<key>`: Set bookmark (use uppercase for global)
  - `'<key>`: Jump to bookmark

- Window operations (`Ctrl + W`):
  - `v`: Split vertically
  - `s`: Split horizontally
