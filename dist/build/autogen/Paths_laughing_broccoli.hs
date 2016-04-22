module Paths_laughing_broccoli (
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

bindir     = "/afs/inf.ed.ac.uk/user/s15/s1554753/.cabal/bin"
libdir     = "/afs/inf.ed.ac.uk/user/s15/s1554753/.cabal/lib/x86_64-linux-ghc-7.8.4/laughing-broccoli-0.1.0.0"
datadir    = "/afs/inf.ed.ac.uk/user/s15/s1554753/.cabal/share/x86_64-linux-ghc-7.8.4/laughing-broccoli-0.1.0.0"
libexecdir = "/afs/inf.ed.ac.uk/user/s15/s1554753/.cabal/libexec"
sysconfdir = "/afs/inf.ed.ac.uk/user/s15/s1554753/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "laughing_broccoli_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "laughing_broccoli_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "laughing_broccoli_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "laughing_broccoli_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "laughing_broccoli_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
