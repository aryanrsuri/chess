package main


@(private)
move_is_valid :: proc(squares: squares, from, to: int) -> bool {
	// TODO
	return true
}

move_piece_to_square :: proc(squares: ^squares, from, to: int) {
	if squares[from] == nil {
		panic("Square is empty")
	}

	if squares[to] == nil && move_is_valid(squares^, from, to) {
		squares[to] = squares[from]
		squares[from] = nil
	}
}
