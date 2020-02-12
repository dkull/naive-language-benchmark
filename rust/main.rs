#[allow(dead_code)]
use std::time::Instant;

struct RC4 {
    s: [u8; 256],
    i: usize,
    j: usize,
}

impl RC4 {
    fn new(key: &[u8]) -> RC4 {
        let mut data = [0u8; 256];
        for i in 0..256 {
            data[i] = i as u8;
        }

        let mut j: u32 = 0;
        for i in 0..256 {
            j = (j + data[i] as u32 + key[i % key.len()] as u32) % 256;
            let a = data[i as usize];
            let b = data[j as usize];
            data[i as usize] = b;
            data[j as usize] = a;
        }

        RC4 {
            s: data,
            i: 0,
            j: 0,
        }
    }

    fn get_byte(&mut self) -> u8 {
        self.i = (self.i + 1) % 256;
        self.j = (self.j + self.s[self.i] as usize) as usize % 256;

        let a = self.s[self.i];
        let b = self.s[self.j];
        self.s[self.i] = b;
        self.s[self.j] = a;

        let idx = (self.s[self.i] as usize + self.s[self.j] as usize) % 256;
        return self.s[idx as usize];
    }
}

fn bench() {
    let start = Instant::now();

    let key = "Keyfobsrulethebestofall".as_bytes();
    let mut rc4 = RC4::new(key);

    let mut sum: u64 = 0;
    for _i in 0..2000000000 {
        sum += rc4.get_byte() as u64;
    }

    let end = start.elapsed().as_millis();
    println!("rust rc4 {} in {}", sum, end);
}

fn main() {
    bench()
}

#[no_mangle]
pub extern "C" fn prod(a: i64, b: i64) -> i64 {
    return a * b;
}
