pub fn abbreviate(phrase: &str) -> String {
    let sanitized: String = phrase
        .chars()
        .map(|item| {
            if item.is_alphabetic() || item.is_whitespace() {
                item
            } else if item == '\'' {
                '\0'
            } else {
                ' '
            }
        })
        .collect();
    let split = sanitized
        .split(" ")
        .collect::<Vec<_>>()
        .iter()
        .map(|s| {
            if let Some(first_char) = s.chars().next() {
                let word = if s
                    .chars()
                    .all(|item| item.is_uppercase() && item.is_alphabetic())
                {
                    first_char.to_string()
                } else {
                    s.chars()
                        .enumerate()
                        .map(|tup| {
                            let (idx, cur_char) = tup;
                            if idx == 0 {
                                cur_char.to_uppercase().to_string()
                            } else {
                                cur_char.to_string()
                            }
                        })
                        .collect()
                };
                let word = word
                    .chars()
                    .filter(|item| item.is_uppercase() && item.is_alphabetic())
                    .collect();
                word
            } else {
                "".to_string()
            }
        })
        .collect();
    split
}
