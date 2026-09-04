# CS50 R — Problem Set 1: Pit Stop

## Task Description

The goal of this task is to create `pitstop.R`, an R program that analyzes Formula One pit-stop data stored in CSV files.

The program must:

1. Ask the user to enter a CSV filename.
2. Read the selected file.
3. Print:
   - The total number of pit stops
   - The shortest pit-stop duration
   - The longest pit-stop duration
   - The total time spent on pit stops

Assignment: [CS50 Pit Stop](https://cs50.harvard.edu/r/psets/1/pitstop/)

## Results

### Miami Grand Prix

Input:

```text
miami.csv
```

## Expected Output

```text
Total pit stops: 28
Shortest pit stop: 1.94 seconds
Longest pit stop: 11.05 seconds
Total pit-stop time: 98.53 seconds
```

![Pit stop miami result](screenshots/miami.png)

### Suzuka Grand Prix

Input:

```text
suzuka.csv
```

## Expected Output

```text
Total pit stops: 36
Shortest pit stop: 2.08 seconds
Longest pit stop: 5.43 seconds
Total pit-stop time: 105.32 seconds
```

![Pit stop suzuka result](screenshots/suzuka.png)

## Datasets

### Miami Grand Prix

| team | driver | time | lap |
| --- | --- | --- | --- |
| Williams | Albon | 3.04 | 10 |
| Aston Martin | Stroll | 3.03 | 11 |
| Sauber | Bottas | 3.74 | 11 |
| Williams | Sargeant | 2.56 | 11 |
| Alpine | Gasly | 2.52 | 12 |
| Haas | Hulkenberg | 3.26 | 12 |
| Red Bull | Perez | 1.95 | 17 |
| Ferrari | Leclerc | 1.94 | 19 |
| Alpine | Ocon | 2.56 | 22 |
| Aston Martin | Alonso | 2.36 | 22 |
| Haas | Magnussen | 2.86 | 22 |
| Red Bull | Verstappen | 2.22 | 23 |
| Mercedes | Russell | 3.1 | 24 |
| Mercedes | Hamilton | 2.49 | 26 |
| Ferrari | Sainz | 3.19 | 27 |
| McLaren | Piastri | 2.6 | 27 |
| Aston Martin | Stroll | 2.65 | 28 |
| Haas | Hulkenberg | 2.51 | 28 |
| Haas | Magnussen | 9.85 | 28 |
| RB | Ricciardo | 2.56 | 28 |
| RB | Tsunoda | 2.44 | 28 |
| Red Bull | Perez | 2.64 | 28 |
| Sauber | Zhou | 2.73 | 28 |
| McLaren | Norris | 2.17 | 29 |
| Sauber | Bottas | 2.81 | 29 |
| Haas | Magnussen | 11.05 | 31 |
| McLaren | Piastri | 10.7 | 40 |
| Williams | Albon | 3 | 53 |

### Suzuka Grand Prix

| team | driver | time | lap |
| --- | --- | --- | --- |
| Haas | Hulkenberg | 2.93 | 5 |
| Sauber | Bottas | 4.06 | 6 |
| RB | Tsunoda | 2.56 | 7 |
| Sauber | Zhou | 2.93 | 7 |
| McLaren | Norris | 2.31 | 11 |
| Sauber | Zhou | 5.43 | 11 |
| Aston Martin | Stroll | 2.63 | 12 |
| McLaren | Piastri | 2.97 | 12 |
| Aston Martin | Alonso | 2.34 | 13 |
| Ferrari | Sainz | 2.32 | 15 |
| Red Bull | Perez | 2.16 | 15 |
| Alpine | Gasly | 3.25 | 16 |
| Red Bull | Verstappen | 2.17 | 16 |
| Alpine | Ocon | 2.35 | 19 |
| Aston Martin | Stroll | 2.43 | 22 |
| Haas | Magnussen | 5.41 | 22 |
| Mercedes | Russell | 2.67 | 22 |
| RB | Tsunoda | 2.76 | 22 |
| Sauber | Bottas | 4.94 | 22 |
| Williams | Sargeant | 4.28 | 22 |
| Mercedes | Hamilton | 2.62 | 23 |
| Ferrari | Leclerc | 2.46 | 26 |
| McLaren | Norris | 2.61 | 26 |
| Alpine | Gasly | 2.32 | 32 |
| McLaren | Piastri | 2.45 | 32 |
| Alpine | Ocon | 3.24 | 33 |
| Aston Martin | Alonso | 2.42 | 33 |
| Haas | Hulkenberg | 3.31 | 33 |
| Red Bull | Perez | 2.13 | 33 |
| Aston Martin | Stroll | 2.42 | 34 |
| Red Bull | Verstappen | 2.08 | 34 |
| Williams | Sargeant | 3.38 | 34 |
| Ferrari | Sainz | 2.9 | 36 |
| Mercedes | Russell | 2.37 | 37 |
| Mercedes | Hamilton | 3.32 | 39 |
| Williams | Sargeant | 2.39 | 41 |