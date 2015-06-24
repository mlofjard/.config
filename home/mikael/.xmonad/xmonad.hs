import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO

myLayout = tiled ||| Mirror tiled ||| Full
    where
        tiled = spacing 5 $ Tall nmaster delta ratio
        nmaster = 1
        ratio = 2/3
        delta = 5/100

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/mikael/.xmobar/xmobarrc"
    xmonad $ defaultConfig
        { layoutHook    = smartBorders $ avoidStruts $ myLayout ||| layoutHook defaultConfig
        , terminal      = "urxvt"
        , modMask       = mod4Mask
        , borderWidth   = 1
        , normalBorderColor     = "white"
        , focusedBorderColor    = "#F92672"
        , handleEventHook       = fullscreenEventHook
        , manageHook    = composeAll [ isFullscreen --> doFullFloat ] <+> manageDocks <+> manageHook defaultConfig
        , logHook       = dynamicLogWithPP xmobarPP
            { ppOutput  = hPutStrLn xmproc
            , ppTitle   = xmobarColor "#CECECE" "" . shorten 80
            , ppLayout  = const ""
            }
        }
        `additionalKeysP`
        [ ("M-c", spawn "chromium --disk-cache-dir=/tmp/cache")
        , ("M-f", spawn "firefox")
        , ("M-p", spawn "dmenu_run -l 10 -p \"Command\" -fn \"Terminus-10\" -nb \"#1D1E23\" -nf \"#CECECE\" -sb \"#AE81FF\" -sf \"#FFFFFF\"")
        , ("M-<F10>", spawn "pulseaudio-ctl mute")
        , ("M-<F11>", spawn "pulseaudio-ctl down")
        , ("M-<F12>", spawn "pulseaudio-ctl up")
        , ("M-<F3>", spawn "sudo /home/mikael/scripts/kbd_brightness_down.sh")
        , ("M-<F4>", spawn "sudo /home/mikael/scripts/kbd_brightness_up.sh")
        , ("M-<F5>", spawn "/home/mikael/scripts/brightness.sh down")
        , ("M-<F6>", spawn "/home/mikael/scripts/brightness.sh up")
        , ("M-<F9>", spawn "/home/mikael/scripts/touchpad_toggle.sh")
        ]
