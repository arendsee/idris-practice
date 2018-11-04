module Main

{- chooseType : Nat -> Type        -}
{- chooseType Z = String           -}
{- chooseType _ = Nat              -}
{-                                 -}
{- foo : (x : Nat) -> chooseType x -}
{- foo Z = "Nothing"               -}
{- foo x = x                       -}


isSingleton : Bool -> Type
isSingleton True = Nat
isSingleton False = List Nat

mkSingle : (single : Bool) -> isSingleton single
mkSingle True = 0
mkSingle _ = []
{- mkSingle False = [] -- but this works? -}

sum : (single : Bool) -> isSingleton single -> Nat
sum True x = x
sum False [] = 0
sum False (x::xs) = x + sum False xs

main : IO ()
main = do
  printLn (sum True 34)
  printLn (sum False [1,2,3])
  printLn (mkSingle False)
  printLn (mkSingle True)
  {- printLn (foo Z)     -}
  {- printLn (foo (S Z)) -}
