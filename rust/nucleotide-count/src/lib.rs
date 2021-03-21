use std::collections::HashMap;

fn good_char(nucleotide: char) -> bool {
    match nucleotide {
        'A' | 'G' | 'T' | 'C' => true,
        _ => false,
    }
}

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    if !good_char(nucleotide) {
        Err(nucleotide)
    } else if let Some(bad_char) = dna.chars().filter(|c| !good_char(*c)).next() {
        Err(bad_char)
    } else {
        Ok(dna.chars().filter(|c| *c == nucleotide).count())
    }
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    "GCAT".chars().fold(Ok(HashMap::new()), |mut res, c| {
        let thecount = count(c, dna);
        if res.is_err() {
            res
        } else if let Err(thecount) = thecount  {
            Err(thecount)
        } else if let (Ok(thecount), Ok(themap)) = (thecount, &mut res) {
            themap.insert(c, thecount);
            res
        } else {
            res
        }
    })
}
