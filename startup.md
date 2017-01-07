shellrc startup order

## init/init
init/init is the first script run by shellrc

It must be added manually to your shell's startup script (.zshrc, .bashrc)

## init/shell.d

init/shell.d is run as part of init/init

It is intended for initialization variables that are different between shells

## init/login.d
init/login.d scripts are run immediately after init/init has been loaded, but before control would return
to the main shellrc

They are meant to emulate "login scripts" - scripts that are run only when you login to the shell
and not when a new non-login shell occurs.

The best example of this is tmux/screen/byobu. Loading these multiple times can cause an infinite loop.

If a script replaces the login shell before completion (looking at you, byobu), these will be skipped 
on the second iteration.

## init/shellrc.d

Loaded for each shell instance. Each script looks at the .{extension} files for its shell and loads them in numeric 
order.  .{extension} is .{sh,bash} for bash, .{sh,zsh} for zsh, and {.sh} for bourne

Currently, use something similar to

  for _shell_path in shellrc.d; do
    _load_shellrc_path $_shell_path
  done

in your shell script. This behaviour will probably change in the future, as $_shell_path is no longer variable.

## platform.d

Overrides for specific platforms. After shellrc.d is loaded, platform.d can run to override changes. This is most useful in cygwin for replacing certain slow functions with overloaded faster ones.




[main shellrc init script, must be added to your shell's startup files]
- load init/login.d  [once-only scripts. Useful for applications that replace the shell]

