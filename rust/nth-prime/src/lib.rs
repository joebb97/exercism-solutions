fn is_prime(n: u32) -> bool {
    let upper_limit = ((n as f64).sqrt() as u32) + 1;
    // let upper_limit = n - 1;
    for it in 2..upper_limit {
        if n % it == 0 {
            return false;
        }
    }
    true
}

pub fn nth(n: u32) -> u32 {
    let mut counter = 0;
    let mut current_prime = 2;
    while counter != n {
        current_prime += 1;
        if is_prime(current_prime) {
            counter += 1
        }
    }
    current_prime
}
