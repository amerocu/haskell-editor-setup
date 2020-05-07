module Solutions.Chapter06Bis where
-- inverte gli elementi di una lista (fold)
reverseRecursive :: [a] -> [a]
reverseRecursive xs = reverseRecursive' [] xs

reverseRecursive' :: [a] -> [a] -> [a]
reverseRecursive' acc [] = acc
reverseRecursive' acc (x: xs) = reverseRecursive' (x : acc) xs

reverseFoldr :: [a] -> [a]
reverseFoldr xs = foldr (\ a acc -> acc ++ [a]) [] xs

reverseFoldl :: [a] -> [a]
reverseFoldl xs = foldl (flip (:)) [] xs


-- scrivere la funzione del fattoriale (fold)
factFoldl :: Int -> Int 
factFoldl val = foldl (*) 1 [2..val]

sumFoldl :: [Int] -> Int
sumFoldl xs = foldl (+) 0 xs

-- insert an element at a given position into a list  (fold e and other methods)
-- insertAt 'c' 2 ['a', 'b', 'd', 'e'] => ['a', 'b', 'c', 'd', 'e']
--              ^  ^  ^  ^  ^
--              0  1  2  3  4..>
insertAtRecursive :: a -> Int -> [a] -> [a]
insertAtRecursive a 0 xs = a : xs
insertAtRecursive a _ [] = [a]
insertAtRecursive a pos (x: xs) = x : insertAtRecursive a (pos - 1) xs


insertAt :: a -> Int -> [a] -> [a]
insertAt a b xs = let sample acc val = if length acc == b 
                                       then val:a:acc--reverse(a:val:reverse acc)
                                       else val:acc--reverse (val:reverse acc)
                  in reverse $ foldl sample [] xs

-- scrivere una funzione che elimina gli elementi in posizione pari (fold e altri modi, filter)
oddList :: [a] -> [a]
oddList = undefined
-- oddList = removeFirst

--     removeFirst :: [a] -> [a]
--     removeFirst (x:xs) = removeSecond xs 

--     removeSecond :: [a] -> [a]
--     removeSecond (x:xs) = x : removeFirst xs


-- scrivere una funzione che mappa gli elementi in posizione dispari (fold e altri modi)
-- NB: notare la differenza tra la firma di una map normale
-- map :: (a -> b) -> [a] -> [b]
mapOdd :: (a -> a) -> [a] -> [a] 
mapOdd = undefined

-- Scrivere una funzione che costruisce, a partire da una lista di numeri interi, una lista di coppie in cui:
-- (a) il primo elemento di ogni coppia `e uguale all’elemento di corrispondente posizione nella lista originale e
-- (b) il secondo elemento di ogni coppia `e uguale alla somma di tutti gli elementi antecedenti della lista originale.
-- (b.is) il secondo elemento di ogni coppia `e uguale alla differenza tra la somma di tutti gli elementi della lista e l'elemento.

-- se ne possono fare 3 versioni
-- 1. ricorsione normale
-- 2. ricorsione con foldl
-- 3. ricorsione con foldr (molto difficile)

-- annotateSumUntil [1] =>  [(1, 0)]
-- annotateSumUntil [1, 2, 3, 4] =>  [(1, 0), (2, 1), (3, 3), (4, 6)]
annotateSumUntilRecursive :: [Int] -> [(Int, Int)]
annotateSumUntilRecursive xs = annotateSumUntilRecursive' 0 xs

annotateSumUntilRecursive' :: Int -> [Int] ->  [(Int, Int)]
annotateSumUntilRecursive'  _ []= []
annotateSumUntilRecursive'  n (x:xs) = (x, n) : annotateSumUntilRecursive' (n + x) xs

annotateSumUntilFoldl1 :: [Int] -> [(Int, Int)]
annotateSumUntilFoldl1 xs = snd res where

    f :: (Int, [(Int, Int)]) -> Int -> (Int, [(Int, Int)])
    f (sum, l) a = (sum + a, l ++ [(sum, a)])

    res :: (Int, [(Int, Int)]) 
    res = foldl f (0, []) xs

annotateSumUntilFoldl2 :: [Int] -> [(Int, Int)]
annotateSumUntilFoldl2 [] = []
annotateSumUntilFoldl2 (x:xs) = foldl f [(x, 0)] xs where 
    f :: [(Int, Int)] -> Int -> [(Int, Int)]
    f acc val = acc ++ [(val, uncurry(+) $ last acc)]

annotateSumUntilFoldr' :: [Int] -> [(Int, Int)]
annotateSumUntilFoldr' xs = resf 0  where

    f :: Int -> (Int -> [(Int, Int)]) -> (Int -> [(Int, Int)])
    -- f a g = \x-> (a, x) : g (x + a)
    f a g x = (a, x) : g (x + a)

    resf :: Int -> [(Int, Int)]
    resf = foldr f (const []) xs

-- raggruppa un lista per modulo n  (fold)
-- groupNumbers 2 [1, 2, 3, 4, 5, 6] => [[6, 4, 2], [5, 3, 1]]
-- groupNumbers 5 [1, 2, 3, 4, 5] => [[5], [1], [2], [3], [4]]
-- mod 5 5 => 0
-- mod 1 5 => 1
-- mdd 2 5 => 2
-- ..
groupNumbers :: Int -> [Int] -> [[Int]]
groupNumbers = undefined

-- rimuove tutti i valori duplicati (fold)
unique :: (Eq a) => [a] -> [a]
unique = undefined

-- comprime una lista rimuovendo i doppioni vicini (fold)
-- compress [1, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2 ,2 ] => [1, 2, 1, 2, 1, 2, 1, 2]
compress :: (Eq a) => [a] -> [a]
compress = undefined