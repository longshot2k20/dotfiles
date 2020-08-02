# Anaconda

## Launching jupyter notebook with base folder in cwd

```console
conda activate bootcamp
conda run jupyter notebook
```

or

launch from Anaconda Navigator

to list token of running jupyter notebooks

```console
conda run jupyter notebook list
Currently running servers:
http://localhost:8888/?token=d8d01dc84ba36f4be55e920fb6511ebf0553280793563a20 :: /Users/apanizo
```

stop running notebook

```console
conda run jupyter notebook stop 8888
Shutting down server on port 8888 ...
```

Jupyter Notebook Shortcuts

Windows/Linux shortcut keys

- Ctrl: command key ⌘
- Shift: Shift ⇧
- Alt: option ⌥
- Right-click: control key

Shortcuts in both modes:

- Shift + Enter run the current cell, select below
- Ctrl + Enter run selected cells
- Alt + Enter run the current cell, insert below
- Ctrl + S save and checkpoint

While in command mode (press Esc to activate):

- Enter take you into edit mode
- H show all shortcuts
- Up select cell above
- Down select cell below
- Shift + Up extend selected cells above
- Shift + Down extend selected cells below
- A insert cell above
- B insert cell below
- X cut selected cells
- C copy selected cells
- V paste cells below
- Shift + V paste cells above
- D, D (press the key twice) delete selected cells
- Z undo cell deletion
- S Save and Checkpoint
- Y change the cell type to Code
- M change the cell type to Markdown
- P open the command palette.

This dialog helps you run any command by name. It’s really useful if you don’t know some shortcut or when you don’t have a shortcut for the wanted command.

- Shift + Space scroll notebook up
- Space scroll notebook down
- While in edit mode (press Enter to activate)
- Esc take you into command mode
- Tab code completion or indent
- Shift + Tab tooltip
- Ctrl + ] indent
- Ctrl + [ dedent
- Ctrl + A select all
- Ctrl + Z undo
- Ctrl + Shift + Z or Ctrl + Y redo
- Ctrl + Home go to cell start
- Ctrl + End go to cell end
- Ctrl + Left go one word left
- Ctrl + Right go one word right
- Ctrl + Shift + P open the command palette
- Down move cursor down
- Up move cursor up
