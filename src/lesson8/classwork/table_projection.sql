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