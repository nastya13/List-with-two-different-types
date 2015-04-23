module Main where


data List a b = LNil | ElemA { valA :: a
                            , next :: (List a b)
                            }
                     | ElemB { valB :: b
                             , next :: (List a b)
                             }
-- Interp. list of elements

empty_list :: List a b
empty_list = LNil


instance (Show a, Show b) => Show (List a b) where
    show t = Main.showList t

--instance (Eq a, Eq b) => Eq (List a b) where
  --  list1 == list2 = (valA list1 == valA list2)
    --list1 == list2 = (valB list1 == valB list2)
    --list == LNil = (valA list == )
    --list1 /= list2 = not (list1 == list2)




------------------------------------------------------------------------------------
showList :: (Show a, Show b) => List a b -> String
showList LNil = "[]"
showList t =  let
                   go res step nxt = if (step `mod` 2 == 0) && (step /= length_list t)
                                        then go (res ++ show (valA nxt) ++ ", ") (step+1) (next nxt)
                                     else if (step < (length_list t) - 1) 
                                              then go (res ++ show (valB nxt) ++ ", ") (step+1) (next nxt) 
                                          else if (step == (length_list t) - 1) 
                                                   then go (res ++ show (valB nxt)) (step+1) (next nxt)
                                               else (res ++ "]")
              in go "[" 0 t



-------------------------------------------------------------------------------------
gen_list :: [a] -> [b] -> (List a b)
gen_list [] [] = LNil 
gen_list l1 l2 = let
                    go step el = if step >= (length l1)
                                    then LNil
                                 else if el 
                                          then ElemA (l1!!step) (go step False) 
                                      else ElemB (l2!!step) (go (step+1) True)
                                      
                 in go 0 True


-------------------------------------------------------------------------------------
length_list :: List a b -> Int
length_list LNil = 0
length_list list = 1 + length_list (next list)

------------------------------------------------------------------------------------

dmap :: List a b -> (a -> c) -> (b -> d)-> List c d
dmap LNil operA operB = LNil
dmap (ElemA x next) operA operB = ElemA (operA x) (dmap next operA operB)
dmap (ElemB x next) operA operB = ElemB (operB x) (dmap next operA operB)



main = print (dmap (gen_list [1,2,3,4,5] ["aaa", "bbb", "ccc", "ddd", "eee"]) (2*) ("new"++))
