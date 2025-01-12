{-
waymonad A wayland compositor in the spirit of xmonad
Copyright (C) 2017  Markus Ongyerth

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Reach us at https://github.com/ongy/waymonad
-}
{-# LANGUAGE OverloadedStrings, ApplicativeDo #-}
module Config.Box
where

import Config.Schema

import qualified Graphics.Wayland.WlRoots.Box as R

data Point a = Point
    { pointX :: a
    , pointY :: a
    } deriving (Eq, Show)

instance HasSpec a => HasSpec (Point a) where
    anySpec = sectionsSpec "point" $ do
        x <- reqSection "x" "The x position of the point"
        y <- reqSection "y" "The y position of the point"

        pure $ Point x y

asRootsPoint :: Integral a => Point a -> R.Point
asRootsPoint (Point x y) = R.Point (fromIntegral x) (fromIntegral y)
