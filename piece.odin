package main

piece_type :: enum {
	Rook,
	Knight,
	Bishop,
	Queen,
	King,
	Pawn,
}


ent_piece :: struct {
	prop_color: bool,
	prop_type:  piece_type,
}
