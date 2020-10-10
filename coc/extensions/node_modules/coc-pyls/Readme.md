# coc-pyls

Python language server extension using [python-language-server](https://github.com/palantir/python-language-server)
for [coc.nvim](https://github.com/neoclide/coc.nvim).

**Deprecated pyls not maintained**

## Install

Install `pyls` by:

    pip install python-language-server

In your vim/neovim, run command:

    :CocInstall coc-pyls

## Features

- Auto Completion
- Code Linting with pycodestyle and pyflakes
- Signature Help
- Go to definition
- Hover
- Find References
- Document Symbols
- Document Formatting

## Configuration options

- `pyls.enable` set to `false` to disable pyls language server.
- `pyls.trace.server` trace LSP traffic in output channel.
- `pyls.commandPath` absolute path of pyls executable.

Trigger completion in `coc-settings.json` to get complete list.

## License

MIT
