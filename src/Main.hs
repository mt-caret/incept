module Main where

import Asterius.Types
import qualified Text.Pandoc as P

foreign import javascript
   "(() => {                                    \
   \   console.log($1);                         \
   \   const d = document.createElement('div'); \
   \   d.innerHTML = $1;                        \
   \   document.body.appendChild(d);            \
   \ })()"
   printToDom' :: JSString -> IO ()

printToDom :: String -> IO ()
printToDom = printToDom' . toJSString

main = printToDom "Hello, World!"
