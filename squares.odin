package main

import "core:fmt"
import "core:strings"

squares :: [64]union {
	ent_piece,
}

@(private)
pos_from_end :: proc(x: int) -> int {
	// TODO: understand the math here
	return (7 - x / 8) * 8 + x % 8
}

str_to_pos :: proc(loc: string) -> u8 {
	x := loc[0] - 97
	y := loc[1] - 49
	return x + y * 8
}

init_squares :: proc() -> squares {
	ordinal := [16]piece_type {
		piece_type.Rook,
		piece_type.Knight,
		piece_type.Bishop,
		piece_type.Queen,
		piece_type.King,
		piece_type.Bishop,
		piece_type.Knight,
		piece_type.Rook,
		piece_type.Pawn,
		piece_type.Pawn,
		piece_type.Pawn,
		piece_type.Pawn,
		piece_type.Pawn,
		piece_type.Pawn,
		piece_type.Pawn,
		piece_type.Pawn,
	}
	squares := squares{}
	for i := 0; i < 16; i += 1 {
		squares[pos_from_end(i)] = ent_piece{false, ordinal[i]}
		squares[i] = ent_piece{true, ordinal[i]}
	}

	return squares
}

piece_to_str :: proc(piece: union {
		ent_piece,
	}) -> string {

	if piece == nil {
		return "."
	}
	symbols := [piece_type]string {
		.King   = "K",
		.Queen  = "Q",
		.Knight = "N",
		.Bishop = "B",
		.Rook   = "R",
		.Pawn   = "P",
	}


	p := symbols[piece.(ent_piece).prop_type]
	if !piece.(ent_piece).prop_color {
		return strings.to_lower(p)
	}
	return p
}

print_squares :: proc(squares: squares) {
	for i := 0; i < 64; i += 1 {
		if i != 0 && i % 8 == 0 {
			fmt.printf("\n")
		}
		fmt.printf("%s ", piece_to_str(squares[pos_from_end(i)]))

	}
	fmt.printf("\n")
}
