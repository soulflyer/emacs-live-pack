## Iain's pack

### Changes to emacs-live

In order for the one window only thing to work, popwin must not be 
installed. To do this, comment out the following line in 
packs/stable/foundation-pack/init.el

(live-load-config-file "popwin-conf.el")

Also get rid of the outdated version of refactor-nrepl in the Clojure
pack. Comment out the last section of cider-conf.el

### init.el

Use the file `init.el` for your own configuration elisp. If this starts
getting unwieldy then you might want to break out the config into
separate files which you can store in the config directory.

### config

Files placed in the `config` dir may then be referenced and pulled into
your `init.el` via the fn `live-load-config-file`. For example, if you
have the file config/foo.el then you may load it in with:

    (live-load-config-file "foo.el")

### lib

 If you want to pull in external libraries into your pack, then you
 should place the libraries within the lib dir. To add a directory
 within the pack's lib directory to the Emacs load path (so that it's
 contents are available to require) you can use the fn
 `live-add-pack-lib`. For example, if you have the external library bar
 stored in lib which contains the file `baz.el` which you wish to
 require, this may be achieved by:

    (live-add-pack-lib "bar")
    (require 'baz)

 Have fun!
