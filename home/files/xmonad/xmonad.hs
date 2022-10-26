import XMonad

import System.Exit
import XMonad.Actions.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
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
    . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) myToggleStrutsKey
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
        sendMessage $ Toggle NBFULL)
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
    ]

myTerminal = "kitty"
myMenu = "rofi -modi run,drun,window -show drun"
myScreenshot = "maim -s -u | xclip -selection clipboard -t image/png -i"
myModMask = mod4Mask
myBorderWidth = 2
myNormalBorderColor = col2
myFocusedBorderColor = col9
myFocusFollowsMouse = False
myToggleStrutsKey XConfig{ modMask = m} = (m, xK_b)


myLayouts = mkToggle1 NBFULL
          . lessBorders OnlyScreenFloat
          $ tall ||| Mirror tall ||| Full
    where
        tall = Tall nmaster delta ratio
        nmaster = 1
        ratio = 11/20
        delta = 1/20

myStartupHook = do
    spawn "xsetroot -cursor_name left_ptr"
    spawn "dunst"

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
        colCurrent = xmobarColor col0 col9 . xmobarBorder "Full" col9 1
        colVisible = xmobarColor col0 col10 . xmobarBorder "Full" col10 1
        colHidden = xmobarColor col4 col0
        colHiddenNoWindows = xmobarColor col3 col0
        colUrgent = xmobarColor col0 col4
        colFocused = xmobarColor col9 col0
        colUnfocused = xmobarColor col4 col0

col0 = "#11111b"
col1 = "#313244"
col2 = "#45475a"
col3 = "#585b70"
col4 = "#cdd6f4"
col5 = "#bac2de"
col6 = "#a6adc8"
col7 = "#f5c2e7"
col8 = "#b4befe"
col9 = "#cba6f7"
col10 = "#89b4fa"
col11 = "#f38ba8"
col12 = "#fab387"
col13 = "#f9e2af"
col14 = "#a6e3a1"
col15 = "#94e2d5"
