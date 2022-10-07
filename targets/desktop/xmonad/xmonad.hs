import XMonad

import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import qualified XMonad.Util.Brightness as B
import qualified XMonad.StackSet as W
import qualified Data.Map as M

main :: IO ()
main = xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB (statusBarProp "xmobar -x 1" (pure myXmobarPP)) myToggleStrutsKey
    . withEasySB (statusBarProp "xmobar -x 2" (pure myXmobarPP)) myToggleStrutsKey
    $ myConfig

myConfig = def
    { modMask = myModMask
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , layoutHook = myLayouts
    , focusFollowsMouse = myFocusFollowsMouse
    , startupHook = myStartupHook
    }
    `additionalKeysP`
    [ ("M-<Return>",   spawn myTerminal)
    , ("M-S-<Return>", windows W.swapMaster)
    , ("M-d",          spawn myMenu)
    , ("M-S-s",        unGrab *> spawn myScreenshot)
    , ("M-S-q",        kill)
    , ("M-S-e",        io exitSuccess)
    , ("M-S-r",        spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")
    , ("M-f",          do
        sendMessage ToggleStruts
        sendMessage $ Toggle "Full")
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
    ]

myTerminal = "kitty"
myMenu = "rofi -modi run,drun,window -show drun"
myScreenshot = "maim -s -u | xclip -selection clipboard -t image/png -i"
myModMask = mod4Mask
myBorderWidth = 2
myNormalBorderColor = nord2
myFocusedBorderColor = nord9
myFocusFollowsMouse = False
myToggleStrutsKey XConfig{ modMask = m} = (m, xK_b)

myManageHook = composeAll
    [ isFullscreen --> doFullFloat ]

myLayouts = toggleLayouts (noBorders Full) (tall ||| Mirror tall ||| Full)
    where
        tall = Tall nmaster delta ratio
        nmaster = 1
        ratio = 11/20
        delta = 1/20

myStartupHook = do
    spawn "xsetroot -cursor_name left_ptr"
    spawn "dunst"
    spawn "redshift"

myXmobarPP = def
    { ppSep = colFocused " | "
    , ppWsSep = ""
    , ppTitleSanitize = xmobarStrip
    , ppCurrent = colCurrent . wrap " " " "
    , ppVisible = colVisible . wrap " " " "
    , ppHidden = colHidden . wrap " " " "
    , ppHiddenNoWindows = colHiddenNoWindows . wrap " " " "
    , ppUrgent = colUrgent . wrap (colUrgent "!") (colUrgent "!")
    , ppOrder = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras = [logTitles formatFocused formatUnfocused]
    }
    where
        formatFocused   = wrap (colUnfocused    "[") (colUnfocused    "]") . colFocused . ppWindow
        formatUnfocused = wrap (colUnfocused "[") (colUnfocused "]") . colHiddenNoWindows . ppWindow
        ppWindow :: String -> String
        ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 50
        colCurrent = xmobarColor nord0 nord9 . xmobarBorder "Full" nord9 1
        colVisible = xmobarColor nord0 nord10 . xmobarBorder "Full" nord10 1
        colHidden = xmobarColor nord4 nord0
        colHiddenNoWindows = xmobarColor nord3 nord0
        colUrgent = xmobarColor nord0 nord4
        colFocused = xmobarColor nord9 nord0
        colUnfocused = xmobarColor nord4 nord0

nord0 = "#2e3440"
nord1 = "#3b4252"
nord2 = "#434c5e"
nord3 = "#4c566a"
nord4 = "#d8dee9"
nord5 = "#e5e9f0"
nord6 = "#eceff4"
nord7 = "#8fbcbb"
nord8 = "#88c0d0"
nord9 = "#81a1c1"
nord10 = "#5e81ac"
nord11 = "#bf616a"
nord12 = "#d08770"
nord13 = "#ebcb8b"
nord14 = "#a3be8c"
nord15 = "#b48ead"
