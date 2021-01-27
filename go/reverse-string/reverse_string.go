package reverse

func Reverse(s string) string {
	out := []rune(s)
	for i := 0; i < len(out) / 2; i++ {
		front, back := i, (len(out) - 1 - i)
		out[front], out[back] = out[back], out[front]
	}
	return string(out)
}
