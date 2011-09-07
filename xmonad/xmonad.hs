import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Actions.WindowGo(runOrRaise)
import qualified XMonad.StackSet as W

import XMonad.Actions.PhysicalScreens

main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
        { modMask = mod4Mask
        , terminal = "urxvt"
	    , borderWidth = 0
        , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        } `additionalKeys`
        [ ((mod4Mask, xK_z), switchAndRaise "9" "emacs" "Emacs")
        , ((mod4Mask, xK_f), switchAndRaise "1" "firefox" "Namoroka")
        , ((mod4Mask, xK_s), spawn "gnome-screenshot -w")
        ]

myManageHook = composeAll [ className =? "Gimp"      --> doFloat ]
 
switchAndRaise wkspace prog cName = (windows . W.greedyView) wkspace >> runOrRaise prog (className =? cName)
