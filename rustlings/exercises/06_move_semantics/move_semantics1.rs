// TODO: Fix the compiler error in this function.
fn fill_vec(vec: Vec<i32>) -> Vec<i32> {
    let mut vec = vec;

    vec.push(88);

    vec
}

// ERTI first solution! Way to complicated!
// fn fill_vec(mut vec: Vec<i32>) -> Vec<i32> {
//     let vec_ = &mut vec;

//     vec_.push(88);

//     vec
// }

fn main() {
    // // You can optionally experiment here.
    // let vec0 = vec![22, 44, 66];
    // let vec1 = fill_vec(vec0);

    // let mut x = 7;
    // let mut y = x;
    // x = 8;
    // println!("{x} {y}");

    // let mut vec0 = vec0;
    // vec0.push(42);

    // let vec0 = vec0;
    // println!("{vec0:?}");

    let vec0 = vec![22, 44, 66];

    let mut vec0 = vec0; // make mutable by shadowing
    vec0.push(42);

    let vec0 = vec0; // shadow again to make it immutable
    println!("{vec0:?}"); // prints [22, 44, 66, 42]

}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn move_semantics1() {
        let vec0 = vec![22, 44, 66];
        let vec1 = fill_vec(vec0);
        assert_eq!(vec1, vec![22, 44, 66, 88]);
    }
}
