# tmux

## Issues

* UTF chars and symbols not loading correctly.
    * Start tmux in UTF-8 support enabled mode.
    ```bash
    tmux -u
    ```
    * Set `LC_TYPE` before starting tmux
    ```bash
    export LC_CTYPE=C.UTF-8
    ```

