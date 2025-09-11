fn main() {
    // TODO: Change the line below to fix the compiler error.
    let x = 10;
    // x = 10; // ERTI can be late init (but makes no sense here)

    if x == 10 {
        println!("x is ten!");
    } else {
        println!("x is not ten!");
    }
}
