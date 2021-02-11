use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {
    let counts: HashMap<String, u32> = HashMap::new();
    words
        .chars()
        .map(|c: char| {
            if !(c.is_alphanumeric() || c == '\'') {
                ' '
            } else {
                c
            }
        })
        .collect::<String>()
        .split_whitespace()
        .fold(counts, |mut cur_dict, word| {
            let pruned = word.trim_matches('\'').to_string().to_lowercase();
            let entry = cur_dict.entry(pruned).or_insert(0);
            *entry += 1;
            cur_dict
        })
}
