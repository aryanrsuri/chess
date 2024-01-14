from state import State
import chess.pgn
import os

for fn in os.listdir("data"):
    pgn = open(os.path.join("data", fn))
    while 1:
        try:
            game = chess.pgn.read_game(pgn)
        except Exception:
            break
        board = game.board()
        rvalue = {"1/2-1/2": 0, "0-1": -1, "1-0": 1}[game.headers["Result"]]
        print(rvalue)
        for i, move in enumerate(game.mainline_moves()):
            board.push(move)
            # TODO: extract the board
            print(rvalue, State(board).serialise())
        exit(0)
    break
