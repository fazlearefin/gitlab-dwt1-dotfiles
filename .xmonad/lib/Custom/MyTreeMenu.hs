module Custom.MyTreeMenu where

  -- imports
import XMonad
import Custom.MyVariables
import Data.Tree
import System.Exit (exitSuccess)
import qualified XMonad.Actions.TreeSelect as TS
import qualified Data.Map as M

------------------------------------------------------------------------
-- TREESELECT
------------------------------------------------------------------------
-- TreeSelect displays your workspaces or actions in a Tree-like format.
-- You can select desired workspace/action with the cursor or hjkl keys.
-- My TreeSelect menu is rather large and includes a mixture of applications,
-- web bookmarks, configuration files and xmonad actions.

treeselectAction :: TS.TSConfig (X ()) -> X ()
treeselectAction a = TS.treeselectAction a
   [ Node (TS.TSNode "Accessories" "Accessory applications" (return ()))
     [ Node (TS.TSNode "Archive Manager" "Tool for archived packages" (spawn "file-roller")) []
     , Node (TS.TSNode "Calculator" "Gui version of qalc" (spawn "qalculate-gtk")) []
     , Node (TS.TSNode "Calibre" "Manages books on my ereader" (spawn "calibre")) []
     , Node (TS.TSNode "Castero" "Terminal podcast client" (spawn (myTerminal ++ " -e castero"))) []
     , Node (TS.TSNode "Compton" "Compositor for window managers" (spawn "killall compton && compton")) []
     , Node (TS.TSNode "Virt-Manager" "Virtual machine manager" (spawn "virt-manager")) []
     , Node (TS.TSNode "Virtualbox" "Oracle's virtualization program" (spawn "virtualbox")) []
     ]
   , Node (TS.TSNode "Games" "fun and games" (return ()))
     [ Node (TS.TSNode "0 A.D" "Real-time strategy empire game" (spawn "0ad")) []
     , Node (TS.TSNode "Battle For Wesnoth" "Turn-based stretegy game" (spawn "wesnoth")) []
     , Node (TS.TSNode "Steam" "The Steam gaming platform" (spawn "steam")) []
     , Node (TS.TSNode "SuperTuxKart" "Open source kart racing" (spawn "supertuxkart")) []
     , Node (TS.TSNode "Xonotic" "Fast-paced first person shooter" (spawn "xonotic")) []
     ]
   , Node (TS.TSNode "Graphics" "graphics programs" (return ()))
     [ Node (TS.TSNode "Gimp" "GNU image manipulation program" (spawn "gimp")) []
     , Node (TS.TSNode "Inkscape" "An SVG editing program" (spawn "inkscape")) []
     , Node (TS.TSNode "LibreOffice Draw" "LibreOffice drawing program" (spawn "lodraw")) []
     , Node (TS.TSNode "Shotwell" "Photo management program" (spawn "shotwell")) []
     , Node (TS.TSNode "Simple Scan" "A simple scanning program" (spawn "simple-scan")) []
     ]
   , Node (TS.TSNode "Internet" "internet and web programs" (return ()))
     [ Node (TS.TSNode "Brave" "A privacy-oriented web browser" (spawn "brave")) []
     , Node (TS.TSNode "Discord" "Chat and video chat platform" (spawn "discord")) []
     , Node (TS.TSNode "Elfeed" "An Emacs RSS feed reader" (spawn "xxx")) []
     , Node (TS.TSNode "FileZilla" "An FTP client" (spawn "filezilla")) []
     , Node (TS.TSNode "Firefox" "Open source web browser" (spawn "firefox")) []
     , Node (TS.TSNode "Geary" "Email client with a nice UI" (spawn "geary")) []
     , Node (TS.TSNode "Jitsi" "Open source video chat" (spawn "xxx")) []
     , Node (TS.TSNode "Mu4e" "An Emacs email client" (spawn "xxx")) []
     , Node (TS.TSNode "Nextcloud" "File syncing desktop utility" (spawn "nextcloud")) []
     , Node (TS.TSNode "Qutebrowser" "Minimal web browser" (spawn "qutebrowser")) []
     , Node (TS.TSNode "Surf Browser" "Suckless surf web browser" (spawn "surf")) []
     , Node (TS.TSNode "Thunderbird" "Open source email client" (spawn "thunderbird")) []
     , Node (TS.TSNode "Transmission" "Bittorrent client" (spawn "transmission-gtk")) []
     , Node (TS.TSNode "Zoom" "Web conferencing" (spawn "zoom")) []
     ]
   , Node (TS.TSNode "Multimedia" "sound and video applications" (return ()))
     [ Node (TS.TSNode "Alsa Mixer" "Alsa volume control utility" (spawn (myTerminal ++ " -e alsamixer"))) []
     , Node (TS.TSNode "Audacity" "Graphical audio editing program" (spawn "audacity")) []
     , Node (TS.TSNode "Deadbeef" "Lightweight music player" (spawn "deadbeef")) []
     , Node (TS.TSNode "EMMS" "Emacs multimedia player" (spawn "xxx")) []
     , Node (TS.TSNode "Kdenlive" "Open source non-linear video editor" (spawn "kdenlive")) []
     , Node (TS.TSNode "OBS Studio" "Open Broadcaster Software" (spawn "obs")) []
     , Node (TS.TSNode "Pianobar" "A terminal Pandora client" (spawn (myTerminal ++ " -e pianobar"))) []
     , Node (TS.TSNode "VLC" "Multimedia player and server" (spawn "vlc")) []
     ]
   , Node (TS.TSNode "Office" "office applications" (return ()))
     [ Node (TS.TSNode "LibreOffice" "Open source office suite" (spawn "libreoffice")) []
     , Node (TS.TSNode "LibreOffice Base" "Desktop database front end" (spawn "lobase")) []
     , Node (TS.TSNode "LibreOffice Calc" "Spreadsheet program" (spawn "localc")) []
     , Node (TS.TSNode "LibreOffice Draw" "Diagrams and sketches" (spawn "lodraw")) []
     , Node (TS.TSNode "LibreOffice Impress" "Presentation program" (spawn "loimpress")) []
     , Node (TS.TSNode "LibreOffice Math" "Formula editor" (spawn "lomath")) []
     , Node (TS.TSNode "LibreOffice Writer" "Word processor" (spawn "lowriter")) []
     , Node (TS.TSNode "Zathura" "PDF Viewer" (spawn "zathura")) []
     ]
   , Node (TS.TSNode "Programming" "programming and scripting tools" (return ()))
     [ Node (TS.TSNode "Emacs" "Doom Emacs launched as client" (spawn "emacsclient -c -a emacs")) []
     , Node (TS.TSNode "Python" "Python interactive prompt" (spawn (myTerminal ++ " -e python"))) []
     ]
   , Node (TS.TSNode "System" "system tools and utilities" (return ()))
     [ Node (TS.TSNode "Alacritty" "GPU accelerated terminal" (spawn "alacritty")) []
     , Node (TS.TSNode "Dired" "Emacs file manager" (spawn "xxx")) []
     , Node (TS.TSNode "Etcher" "USB stick writer" (spawn "xxx")) []
     , Node (TS.TSNode "Glances" "Terminal system monitor" (spawn (myTerminal ++ " -e glances"))) []
     , Node (TS.TSNode "Gufw" "GUI uncomplicated firewall" (spawn "gufw")) []
     , Node (TS.TSNode "Htop" "Terminal process viewer" (spawn (myTerminal ++ " -e htop"))) []
     , Node (TS.TSNode "LXAppearance" "Customize look and feel" (spawn "lxappearance")) []
     , Node (TS.TSNode "Nitrogen" "Wallpaper viewer and setter" (spawn "nitrogen")) []
     , Node (TS.TSNode "Nmon" "Network monitor" (spawn (myTerminal ++ " -e nmon"))) []
     , Node (TS.TSNode "PCManFM" "Lightweight graphical file manager" (spawn "pcmanfm")) []
     , Node (TS.TSNode "Simple Terminal" "Suckless simple terminal" (spawn "st")) []
     , Node (TS.TSNode "Stress Terminal UI" "Stress your system" (spawn (myTerminal ++ " -e vifm"))) []
     , Node (TS.TSNode "Vifm" "Vim-like file manager" (spawn (myTerminal ++ " -e vifm"))) []
     ]
   , Node (TS.TSNode "------------------------" "" (spawn "xdotool key Escape")) []
   , Node (TS.TSNode "Bookmarks" "a list of web bookmarks" (return ()))
     [ Node (TS.TSNode "Linux" "a list of web bookmarks" (return ()))
       [ Node (TS.TSNode "Arch Linux" "btw, i use arch!" (return ()))
         [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         ]
       , Node (TS.TSNode "Linux News" "linux news and blogs" (return ()))
         [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         ]
       , Node (TS.TSNode "Window Managers" "window manager documentation" (return ()))
         [ Node (TS.TSNode "Awesome" "awesomewm documentation" (return ()))
           [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           ]
         , Node (TS.TSNode "Dwm" "dwm documentation" (return ()))
           [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           ]
         , Node (TS.TSNode "Qtile" "qtile documentation" (return ()))
           [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           ]
         , Node (TS.TSNode "XMonad" "xmonad documentation" (return ()))
           [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
           ]
         ]
       , Node (TS.TSNode "Arch Linux" "a list of web bookmarks" (return ()))
         [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         ]
       ]
     , Node (TS.TSNode "Emacs" "Emacs documentation" (return ()))
       [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       ]
     , Node (TS.TSNode "Linux" "a list of web bookmarks" (return ()))
       [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       ]
     , Node (TS.TSNode "Programming" "programming and scripting" (return ()))
       [ Node (TS.TSNode "Bash and Shell Scripting" "shell scripting documentation" (return ()))
         [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         ]
       , Node (TS.TSNode "Elisp" "emacs lisp documentation" (return ()))
         [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         ]
       , Node (TS.TSNode "Haskell" "haskell documentation" (return ()))
         [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         ]
       , Node (TS.TSNode "Python" "python documentation" (return ()))
         [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
         ]
       ]
     , Node (TS.TSNode "Vim" "vim and neovim documentation" (return ()))
       [ Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       , Node (TS.TSNode "xxx" "xxx" (spawn "xxx")) []
       ]
     ]
   , Node (TS.TSNode "Config Files" "config files that edit often" (return ()))
     [ Node (TS.TSNode "alacritty" "alacritty terminal emulator" (spawn (myEditor ++ "/home/dt/.config/alacritty/alacritty.yml"))) []
     , Node (TS.TSNode "awesome" "awesome window manager" (spawn (myEditor ++ "/home/dt/.config/awesome/rc.lua"))) []
     , Node (TS.TSNode "bashrc" "the bourne again shell" (spawn (myEditor ++ "/home/dt/.bashrc"))) []
     , Node (TS.TSNode "bspwmrc" "binary space partitioning window manager" (spawn (myEditor ++ "/home/dt/.config/bspwm/bspwmrc"))) []
     , Node (TS.TSNode "dmenu config.h" "dynamic menu program" (spawn (myEditor ++ "/home/dt/dmenu-distrotube/config.h"))) []
     , Node (TS.TSNode "doom emacs config.org" "doom emacs config" (spawn (myEditor ++ "/home/dt/.doom.d/config.org"))) []
     , Node (TS.TSNode "doom emacs init.el" "doom emacs init" (spawn (myEditor ++ "/home/dt/.doom.d/init.el"))) []
     , Node (TS.TSNode "doom emacs packages.el" "doom emacs packages" (spawn (myEditor ++ "/home/dt/.doom.d/packages.el"))) []
     , Node (TS.TSNode "dunst" "dunst notifications" (spawn (myEditor ++ "/home/dt/.config/dunst/dunstrc"))) []
     , Node (TS.TSNode "dwm config.h" "dynamic window manager" (spawn (myEditor ++ "/home/dt/dwm-distrotube/config.h"))) []
     , Node (TS.TSNode "herbstluftwm" "herbstluft window manager" (spawn (myEditor ++ "/home/dt/.config/herbstluftwm/autostart"))) []
     , Node (TS.TSNode "neovim init.vim" "neovim text editor" (spawn (myEditor ++ "/home/dt/.config/nvim/init.vim"))) []
     , Node (TS.TSNode "polybar" "easy-to-use status bar" (spawn (myEditor ++ "/home/dt/.config/polybar/config"))) []
     , Node (TS.TSNode "qtile config.py" "qtile window manager" (spawn (myEditor ++ "/home/dt/.config/qtile/config.py"))) []
     , Node (TS.TSNode "qutebrowser config.py" "qutebrowser web browser" (spawn (myEditor ++ "/home/dt/.config/qutebrowser/config.py"))) []
     , Node (TS.TSNode "st config.h" "suckless simple terminal" (spawn (myEditor ++ "home/dt/st-distrotube/config.h"))) []
     , Node (TS.TSNode "sxhkdrc" "simple X hotkey daemon" (spawn (myEditor ++ "/home/dt/.config/sxhkd/sxhkdrc"))) []
     , Node (TS.TSNode "surf config.h" "surf web browser" (spawn (myEditor ++ "/home/dt/surf-distrotube/config.h"))) []
     , Node (TS.TSNode "tabbed config.h" "generic tabbed interface" (spawn (myEditor ++ "home/dt/tabbed-distrotube/config.h"))) []
	 , Node (TS.TSNode "xmobar configs" "My xmobar config files" (return ()))
       [ Node (TS.TSNode "xmobar mon1" "status bar on monitor 1" (spawn (myEditor ++ "/home/dt/.config/xmobar/xmobarrc0"))) []
       , Node (TS.TSNode "xmobar mon2" "status bar on monitor 2" (spawn (myEditor ++ "/home/dt/.config/xmobar/xmobarrc2"))) []
       , Node (TS.TSNode "xmobar mon3" "status bar on monitor 3" (spawn (myEditor ++ "/home/dt/.config/xmobar/xmobarrc1"))) []
	   ]
	   , Node (TS.TSNode "XMonad configs" "My xmonad config files" (return ()))
       [ Node (TS.TSNode "xmonad.hs" "My XMonad Main" (spawn (myEditor ++ "/home/dt/.xmonad/xmonad.hs"))) []
       , Node (TS.TSNode "MyGridMenu.hs" "My XMonad GridSelect menu" (spawn (myEditor ++ "/home/dt/.xmonad/lib/Custom/MyGridMenu.hs"))) []
       , Node (TS.TSNode "MyKeys.hs" "My XMonad keybindings" (spawn (myEditor ++ "/home/dt/.xmonad/lib/Custom/MyKeys.hs"))) []
       , Node (TS.TSNode "MyPrompts.hs" "My XMonad prompts" (spawn (myEditor ++ "/home/dt/.xmonad/lib/Custom/MyPrompts.hs"))) []
       , Node (TS.TSNode "MyScratchpads.hs" "My XMonad named scratchpads" (spawn (myEditor ++ "/home/dt/.xmonad/lib/Custom/MyScratchpads.hs"))) []
       , Node (TS.TSNode "MyTreeMenu.hs" "My XMonad TreeSelect menu" (spawn (myEditor ++ "/home/dt/.xmonad/lib/Custom/MyTreeMenu.hs"))) []
       , Node (TS.TSNode "MyVariables.hs" "My XMonad variables" (spawn (myEditor ++ "/home/dt/.xmonad/lib/Custom/MyVariables.hs"))) []
       ]
     , Node (TS.TSNode "xresources" "xresources file" (spawn (myEditor ++ "/home/dt/.Xresources"))) []
     , Node (TS.TSNode "zshrc" "Config for the z shell" (spawn (myEditor ++ "/home/dt/.zshrc"))) []
     ]
   , Node (TS.TSNode "Screenshots" "take a screenshot" (return ()))
     [ Node (TS.TSNode "Quick fullscreen" "take screenshot immediately" (spawn "scrot -d 1 '~/scrot/%Y-%m-%d-@%H-%M-%S-scrot.png'")) []
     , Node (TS.TSNode "Delayed fullscreen" "take screenshot in 5 secs" (spawn "scrot -d 5 '~/scrot/%Y-%m-%d-@%H-%M-%S-scrot.png'")) []
     , Node (TS.TSNode "Section screenshot" "take screenshot of section" (spawn "scrot -s '~/scrot/%Y-%m-%d-@%H-%M-%S-scrot.png'")) []
     ]
   , Node (TS.TSNode "------------------------" "" (spawn "xdotool key Escape")) []
   , Node (TS.TSNode "XMonad" "window manager commands" (return ()))
     [ Node (TS.TSNode "Recompile" "Recompile XMonad" (spawn "xmonad --recompile")) []
     , Node (TS.TSNode "Restart" "Restart XMonad" (spawn "xmonad --restart")) []
     , Node (TS.TSNode "Quit" "Restart XMonad" (io exitSuccess)) []
     ]
   ]

-- Configuration options for treeSelect
tsDefaultConfig :: TS.TSConfig a
tsDefaultConfig = TS.TSConfig { TS.ts_hidechildren = True
                              , TS.ts_background   = 0xdd292d3e
                              , TS.ts_font         = myFont
                              , TS.ts_node         = (0xffd0d0d0, 0xff202331)
                              , TS.ts_nodealt      = (0xffd0d0d0, 0xff292d3e)
                              , TS.ts_highlight    = (0xffffffff, 0xff755999)
                              , TS.ts_extra        = 0xffd0d0d0
                              , TS.ts_node_width   = 200
                              , TS.ts_node_height  = 20
                              , TS.ts_originX      = 0
                              , TS.ts_originY      = 0
                              , TS.ts_indent       = 80
                              , TS.ts_navigate     = myTreeNavigation
                              }

-- Keybindings for treeSelect menus. Use h-j-k-l to navigate.
-- Use 'o' and 'i' to move forward/back in the workspace history.
-- Single KEY's are for top-level nodes. SUPER+KEY are for the
-- second-level nodes. SUPER+ALT+KEY are third-level nodes.
myTreeNavigation = M.fromList
    [ ((0, xK_Escape),   TS.cancel)
    , ((0, xK_Return),   TS.select)
    , ((0, xK_space),    TS.select)
    , ((0, xK_Up),       TS.movePrev)
    , ((0, xK_Down),     TS.moveNext)
    , ((0, xK_Left),     TS.moveParent)
    , ((0, xK_Right),    TS.moveChild)
    , ((0, xK_k),        TS.movePrev)
    , ((0, xK_j),        TS.moveNext)
    , ((0, xK_h),        TS.moveParent)
    , ((0, xK_l),        TS.moveChild)
    , ((0, xK_o),        TS.moveHistBack)
    , ((0, xK_i),        TS.moveHistForward)
    ]