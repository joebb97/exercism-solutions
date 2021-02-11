use std::collections::HashMap;

pub fn prune_word(word: &str) -> String {
    let as_string = if word.starts_with("'") {
        &word[1..]
    } else {
        word
    };
    let as_string = if as_string.ends_with("'") {
        &as_string[0..as_string.len() - 1]
    } else {
        as_string
    };
    as_string.to_string().to_lowercase()
}

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
            let pruned = prune_word(word);
            let entry = cur_dict.entry(pruned).or_insert(0);
            *entry += 1;
            cur_dict
        })
}
