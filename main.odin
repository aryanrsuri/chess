package main

import "core:fmt"
main :: proc() {
	b := init_squares()
	print_squares(b)
	move_piece_to_square(&b, 8, 16)
	fmt.printf("\n")
	print_squares(b)


	fmt.println(str_to_pos("a1"))
	fmt.println(str_to_pos("e8"))
	fmt.println(str_to_pos("f3"))
}
