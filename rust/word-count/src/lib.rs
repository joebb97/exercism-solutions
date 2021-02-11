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
    let mut counts: HashMap<String, u32> = HashMap::new();
    let words: String = words
        .chars()
        .map(|c: char| {
            if !(c.is_alphanumeric() || c == '\'') {
                ' '
            } else {
                c
            }
        })
        .collect();
    for word in words.split_whitespace() {
        let pruned = prune_word(word);
        let new_val = if let Some(&val) = counts.get(&pruned) {
            val + 1
        } else {
            1
        };
        counts.insert(pruned, new_val);
    }
    counts
}
