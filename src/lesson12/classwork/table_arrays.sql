CREATE TABLE chess_game(
    white_player TEXT,
    black_player TEXT,
    moves TEXT[],
    final_state TEXT[][]
);

INSERT INTO chess_game
VALUES ('Caruana', 'Nakamura', '{"d4", "d5", "c4", "c6"}',
        '{{"Ra8", "Qe8", "x", "x", "x", "x", "x", "x"},
          {"a7", "x", "x", "x", "x", "x", "x", "x"},
          {"Kb5", "Bc5", "d5", "x", "x", "x", "x", "x"}}');

SELECT *
FROM chess_game;

INSERT INTO chess_game
VALUES ('Caruana', 'Nakamura',
            ARRAY ['d4', 'd5', 'c4', 'c6'],
            ARRAY [['Ra8', 'Qe8', 'x', 'x', 'x', 'x', 'x', 'x'],
                   ['a7', 'x', 'x', 'x', 'x', 'x', 'x', 'x'],
                   ['Kb5', 'Bc5', 'd5', 'x', 'x', 'x', 'x', 'x']]);

SELECT moves[2:3]
FROM chess_game;

-- from first to 3:
SELECT  moves[:3]
FROM chess_game;

-- from second to last:
SELECT moves[2:]
FROM chess_game;

SELECT array_dims(moves), array_length(moves, 1)
FROM chess_game;

SELECT array_dims(final_state), array_length(moves, 1)
FROM chess_game;

UPDATE chess_game
SET moves = ARRAY['e4', 'd6', 'd4', 'Kf6']
WHERE white_player = 'Caruana';

UPDATE chess_game
SET moves[4] = 'g6';

SELECT *
FROM chess_game
WHERE 'g6' = ANY(moves);