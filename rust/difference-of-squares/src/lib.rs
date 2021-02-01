pub fn square_of_sum(n: u32) -> u32 {
    let ret: u32 = (1..=n).sum();
    ret * ret
}

pub fn sum_of_squares(n: u32) -> u32 {
    let ret: u32 = (1..=n).map(|item| item * item).sum();
    ret
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
