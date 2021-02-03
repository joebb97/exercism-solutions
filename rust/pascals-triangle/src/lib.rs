pub struct PascalsTriangle {
    rows: Vec<Vec<u32>>,
}

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self {
        let mut new_rows: Vec<Vec<u32>> = Vec::new();
        new_rows.reserve(row_count as usize);
        for cur_count in 1..=(row_count as usize) {
            let mut new_row: Vec<u32> = Vec::new();
            new_row.resize(cur_count, 1);
            for (idx, item_ref) in new_row.iter_mut().enumerate() {
                if idx == 0 || idx == cur_count - 1 || cur_count == 1 || cur_count == 2 {
                    continue;
                }
                let row_above = cur_count - 2;
                *item_ref = new_rows[row_above][idx] + new_rows[row_above][idx - 1];
            }
            new_rows.push(new_row);
        }
        Self { rows: new_rows }
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        self.rows.clone()
    }
}
