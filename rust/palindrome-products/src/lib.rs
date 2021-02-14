#[derive(Debug, PartialEq, Eq)]
pub struct Palindrome {
    pairs: Vec<(u64, u64)>,
    value: u64,
}

impl Palindrome {
    pub fn new(a: u64, b: u64) -> Palindrome {
        Self {
            pairs: vec![(a, b)],
            value: a * b,
        }
    }

    pub fn value(&self) -> u64 {
        self.value
    }

    pub fn insert(&mut self, a: u64, b: u64) {
        self.value = a * b;
        self.pairs.push((a, b));
    }
}

pub fn is_palindrome(num: u64) -> bool {
    let mut it = num;
    let mut rev = 0;
    while it != 0 {
        let digit = it % 10;
        rev = digit + (rev * 10);
        it /= 10
    }
    rev == num
}

pub fn palindrome_products(min: u64, max: u64) -> Option<(Palindrome, Palindrome)> {
    let res = (min..=max)
        .map(|left| (left..=max).map(move |right| (left, right)))
        .flatten()
        .fold(
            None,
            |pal_tup_opt: Option<(Palindrome, Palindrome)>, pair| {
                let (left, right) = pair;
                let prod = left * right;
                if let Some((mut cur_min, mut cur_max)) = pal_tup_opt {
                    let cleared = Palindrome::new(left, right);
                    if !is_palindrome(prod) {
                        return Some((cur_min, cur_max));
                    }
                    if prod > cur_max.value() {
                        cur_max = cleared;
                    } else if prod == cur_max.value() {
                        cur_max.insert(left, right);
                    } else if prod < cur_min.value() {
                        cur_min.insert(left, right);
                    } else if prod == cur_min.value() {
                        cur_min = cleared;
                    }
                    Some((cur_min, cur_max))
                } else {
                    if is_palindrome(prod) {
                        return Some((Palindrome::new(left, right), Palindrome::new(left, right)));
                    }
                    None
                }
            },
        );
    res
}
