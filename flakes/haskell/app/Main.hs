module Main where

import Data.Time

main :: IO ()
main = do
    currentTime <- getCurrentTime
    let localTime = utcToLocalTime utc currentTime
    putStrLn $ "Current local time: " ++ show localTime

    let date = localDay localTime
    putStrLn $ "Current date: " ++ showGregorian date

    let (year, month, day) = toGregorian date
    putStrLn $ "Year: " ++ show year
    putStrLn $ "Month: " ++ show month
    putStrLn $ "Day: " ++ show day
