use std::collections::{HashMap, HashSet};

pub fn brackets_are_balanced(string: &str) -> bool {
    let pairs = vec![("}", "{"), ("]", "["), (")", "(")];
    let set: HashSet<&str> = vec!["{", "[", "("].into_iter().collect();
    let map: HashMap<&str, &str> = pairs.into_iter().collect();
    let mut stack: String = String::new();
    for character in string.chars() {
        let as_slice = &(character).to_string()[..];
        if set.contains(as_slice) {
            stack.push(character);
        } else {
            if let Some(opening) = map.get(as_slice) {
                if let Some(top) = stack.pop() {
                    if top.to_string() != *opening {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        }
    }
    stack.is_empty()
}
