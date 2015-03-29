module Paths_List_with_two_different_types (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/anastasia/Haskell/List-with-two-different-types/.cabal-sandbox/bin"
libdir     = "/home/anastasia/Haskell/List-with-two-different-types/.cabal-sandbox/lib/x86_64-linux-ghc-7.8.3/List-with-two-different-types-0.1.0.0"
datadir    = "/home/anastasia/Haskell/List-with-two-different-types/.cabal-sandbox/share/x86_64-linux-ghc-7.8.3/List-with-two-different-types-0.1.0.0"
libexecdir = "/home/anastasia/Haskell/List-with-two-different-types/.cabal-sandbox/libexec"
sysconfdir = "/home/anastasia/Haskell/List-with-two-different-types/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "List_with_two_different_types_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "List_with_two_different_types_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "List_with_two_different_types_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "List_with_two_different_types_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "List_with_two_different_types_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
