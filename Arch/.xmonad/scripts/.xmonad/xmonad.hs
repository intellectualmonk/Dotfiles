-------------------------------------------------------------------------------
--                  __  ____  __                       _                     --
--                  \ \/ /  \/  | ___  _ __   __ _  __| |                    --
--                   \  /| |\/| |/ _ \| '_ \ / _` |/ _` |                    --
--                   /  \| |  | | (_) | | | | (_| | (_| |                    --
--                  /_/\_\_|  |_|\___/|_| |_|\__,_|\__,_|                    --
--                                                                           --
-------------------------------------------------------------------------------
--          written by Tiago Silva  (https://github.com/Athanasi)            --
-------------------------------------------------------------------------------

import XMonad
import Control.Monad
--------------------------------------------------------------------------
import XMonad.Actions.GridSelect
import XMonad.Actions.WithAll
--------------------------------------------------------------------------
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Script
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
--------------------------------------------------------------------------
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce
--------------------------------------------------------------------------
import System.IO
--------------------------------------------------------------------------
import XMonad.Layout.Circle
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
--------------------------------------------------------------------------
import XMonad.Util.Loggers
import XMonad.Util.Paste
--------------------------------------------------------------------------
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import qualified GHC.IO.Handle.Types as H


--------------------------------------------------------------------------
-- workspace --
--------------------------------------------------------------------------

myWorkspaces    :: [String]
myWorkspaces    = clickable $ [ "^i(/home/morgareth/.xmonad/.icons/term.xbm)  Term "++laycon1++""
                              , "^i(/home/morgareth/.xmonad/.icons/www.xbm)  Web "++laycon1++""
                              , "^i(/home/morgareth/.xmonad/.icons/code.xbm)  Code "++laycon1++""
                              , "^i(/home/morgareth/.xmonad/.icons/file1.xbm)  Archive "++laycon1++""
                              , "^i(/home/morgareth/.xmonad/.icons/messenger1.xbm)  Messenger "++laycon1++""
                              ]
                     where clickable l       = [ "^ca(1,xdotool key super+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                                         (i,ws) <- zip [1..] l,
                                         let n = i ]

--------------------------------------------------------------------------
-- style --
--------------------------------------------------------------------------
myLogHook h = do
    dynamicLogWithPP $ tryPP h
tryPP :: Handle -> PP
tryPP h = def
    { ppOutput		= hPutStrLn h
  , ppCurrent 		= dzenColor "#15967D" "#2B2C2B" . pad . wrap  " "  " "
  , ppVisible		= dzenColor "#FFFBF8" "#2B2C2B" . pad . wrap  " "  " "
  , ppHidden		= dzenColor  "#FFFBF8" "#2B2C2B" . pad . wrap  " "  " "
  , ppHiddenNoWindows	= dzenColor "#FFFBF8" "#2B2C2B" . pad . wrap  " "  " "
  , ppWsSep		= ""
  , ppSep			= " "
  , ppLayout		=  wrap lay_start lay_end .
          ( \x -> case x of
        "Spacing 6 Grid"		-> "^ca(1,xdotool key super+space)^i("++laycon++"grid.xbm)^ca()" ++ "   " ++ "GRID"
	"Spacing 6 Spiral"		-> "^ca(1,xdotool key super+space)^i("++laycon++"spiral.xbm)^ca()" ++ "   " ++ "SPIRAL"
	"Spacing 6 Circle"		-> "^ca(1,xdotool key super+space)^i("++laycon++"circle.xbm)^ca()" ++ "   " ++ "CIRCLE"
	"Spacing 6 Tall"		-> "^ca(1,xdotool key super+space)^i("++laycon++"sptall.xbm)^ca()" ++ "   " ++ "SPTALL"
	"Mirror Spacing 10 Tall"	-> "^ca(1,xdotool key super+space)^i("++laycon++"mptall.xbm)^ca()" ++ "   " ++ "MPTALL"
        "Full"	                        -> "^ca(1,xdotool key super+space)^i("++laycon++"full.xbm)^ca()" ++ "   " ++ "FULL"
        )
        , ppOrder  = \(ws:l:t:_) -> [l,ws]
        }
  
---------------------------------------------------------------------------
-- adional key --
---------------------------------------------------------------------------
myKeys = [
    ((mod4Mask, xK_a),
            spawn "firefox")
        , ((mod4Mask, xK_p),
            spawn  "dmenu_run -i -x 415 -y 330 -w 450 -h 20 -l 4 -fn 'xft:edges:pixelsize=9:antialias=True:hinting=True' -nb '#111111' -nf '#FFFBF8' -sb '#15967D' -sf '#111111'")
        , ((0, xK_Print),
            spawn "maim -m 10 ~/Imagens/$(date +%d-%m-%y_%H:%M:%S).png | notify-send -u low 'Screenshot saved to ~/Imagens'")
        , ((mod4Mask, xK_Print),
            spawn "maim -s -m 10 -b 3  --noopengl  ~/Imagens/$(date +%d-%m-%y_%H:%M:%S).png | notify-send -u low 'Screenshot saved to ~/Imagens'")
        , ((mod4Mask, xK_t),
            spawn "Thunar")
        , ((mod4Mask, xK_m),
            spawn "telegram")
        , ((0, xK_Insert),
            pasteSelection)
        , ((mod4Mask, xK_n),
           spawn "feh -x -g 400x400 -B black -N Wallpapers/")
        , ((0, xK_F4), spawn
           "xkill")
        , ((mod4Mask, xK_f),
            sinkAll)
        , ((mod4Mask, xK_x),
            killAll)
        , ((mod4Mask, xK_y), spawn
           "xclip -o -se p | xclip -i -se c")
        , ((mod4Mask,   xK_KP_Subtract), spawn
           "amixer -D pulse sset Master 5%-")
        , ((mod4Mask,   xK_KP_Add), spawn
            "amixer -D pulse sset Master 5%+")
        , ((mod4Mask, xK_q), spawn
           "killall dzen2; xmonad --recompile; xmonad --restart")]

---------------------------------------------------------------------------
-- layout tiling --
---------------------------------------------------------------------------
myLayout = avoidStruts $ smartBorders (  sGrid ||| sSpiral ||| sCircle ||| sTall ||| Mirror sTall ||| Full )
    where
    sTall = spacing 10 $ Tall 1 (1/2) (1/2)
    sGrid = spacing 10 $ Grid
    sCircle = spacing 10 $ Circle
    sSpiral = spacing 10 $ spiral (toRational (2/(1+sqrt(5)::Double)))

---------------------------------------------------------------------------
-- Myapps --
---------------------------------------------------------------------------
myApps = composeAll 
  [ className =? "subl3" --> doFloat
  , className =? "Gimp" --> doFloat
  , className =? "firefox" --> doShift "2:Web"
  , className =? "mpv" --> doFloat 
--  , className =? "Oblogout" --> doIgnore
--  , className =? "Thunar"   --> doFloat
  , className =? "geeqie" --> doCenterFloat
  ]

---------------------------------------------------------------------------
-- main code --
---------------------------------------------------------------------------
main = do 
bar1 <- spawnPipe "echo '^fg(#15967D)^p(;+18)^r(1366x7)' | dzen2 -p -e 'button3=' -fn 'Droid Sans Fallback-8' -ta c -fg '#EFEFEF' -bg '#2B2C2B' -h 32  -w 1366"
bar2 <- spawnPipe "sleep 0.1;dzen2 -p -ta l -e 'button3=' -fn  'xft:Bitstream Vera Sans Mono:size=7:antialias=true' -fg '#FCFCFC'  -bg '#2B2C2B' -h 22 -y 5 -w 365"
bar3 <- spawnPipe "sleep 0.1;conky -c ~/.xmonad/scripts/conky_dzen2  | dzen2 -p -ta r -e 'button3='  -fn  'xft:Bitstream Vera Sans Mono:size=7:antialias=true' -fg '#FCFCFC' -bg '#2B2C2B' -x 365 -h 22 -y 5 -w 1050" 
xmonad $ def
        { manageHook = myApps <+>  manageDocks <+> manageHook def
    , layoutHook = myLayout   
    , borderWidth = 1
    , normalBorderColor = "#FFFBF8"
    , focusedBorderColor = "#404040"
    , terminal = "termite"
    , workspaces = myWorkspaces
    , modMask = mod4Mask
    , startupHook = setWMName "Xmonad"
    , logHook = myLogHook bar2
        } `additionalKeys` myKeys  
     where

laycon   = "/home/morgareth/.xmonad/.icons/"
laycon1 = " ^i(/home/morgareth/.xmonad/.icons/)"
lay_start ="^bg(" ++  "#15967D" ++ ")" ++  "   " ++ laycon1
lay_end = "^ca()^bg(" ++ "#2B2C2B" ++ ")^fg(" ++ "#15967D" ++ ")^i(/home/morgareth/.xmonad/.icons/mr1.xbm)^fg()"
