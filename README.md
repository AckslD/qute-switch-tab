# qute-switch-tab

[userscript](https://github.com/qutebrowser/qutebrowser/blob/master/doc/userscripts.asciidoc) for [qutebrowser](https://github.com/qutebrowser/qutebrowser) for quickly switching between tabs using rofi or dmenu.

![](screencast/qute_switch_tab.gif)

## Installation
Run `install.sh` or simply create a symbolic link or copy the files `switch_tab` and `switch_tab.py` to the qutebrowser's userscripts directory (usually `~/.local/share/qutebrowser/userscripts`) and make it executable.

### Requirements
To use `switch_tab` you need `python` with [`pyyaml`](https://pypi.org/project/PyYAML/) installed and either [`rofi`](https://wiki.archlinux.org/index.php/Rofi) or [`dmenu`](https://wiki.archlinux.org/index.php/Dmenu).

## Usage
To switch to a tab do:
```
session-save switch_tab ;; spawn --userscript switch_tab
```
Note that you need to call `session-save` before to make `switch_tab` know the current open tabs.
Maybe there is another way to do this, see open questions below.

## Key-bindings
You can [set your own key-bindings](https://qutebrowser.org/doc/help/configuring.html) for examples as
```python
config.bind('<Ctrl+P>', 'session-save switch_tab ;; spawn --userscript switch_tab')
```

## Using dmenu
To use `dmenu` instead of `rofi` simply change the following line in `switch_tab.py` to call `dmenu` instead:
```python
    p = run("rofi -dmenu -p \"Select tab\"", input=input, shell=True, capture_output=True)
```

## Contributions
Feel free to contribute or suggest improvements.

### Open questions
Open questions I currently have:
* To find what tabs are currently open, we first save the session. Can this be done in some other way?
* Is there a way to avoid the error `No command given` if one does not make a choice and cancels the command?
* How to avoid the bash-file `switch_tab`? I first only had the python file and tried to do
  ```python
  os.environ["QUTE_FIFO"] += f"tab-focus {tab_num + 1}"
  ```
  but the change to the environment variable didn't seem to have an effect. This is why the bash-file `switch_tab` just wraps `switch_tab.py` to set the environment variable.
* Currently `switch_tab` can only switch between tabs in the same window, how could one switch between all tabs? Probably needs to interact with the window/tiling manager?
* To know which tab is chosen, the information about the tab number is show in the choices passed to `rofi`. Not a big issue but maybe some way to avoid this?
