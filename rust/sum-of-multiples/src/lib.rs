use std::collections::HashSet;
use std::iter::FromIterator;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let min = factors.iter().filter(|item| **item != 0).min();
    let min: u32 = match min {
        Some(val) => limit / val,
        None => 0,
    };
    let res = (1..min + 1)
        .flat_map(|mult| {
            let list = factors.iter().map(move |factor| {
                let cand = factor * mult;
                if cand < limit {
                    cand
                } else {
                    0
                }
            });
            list
        })
        .filter(|item| *item != 0);
    let res: HashSet<u32> = HashSet::from_iter(res);
    let res = res.iter().sum();
    res
}
