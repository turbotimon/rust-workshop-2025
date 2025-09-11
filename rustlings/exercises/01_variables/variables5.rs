fn main() {
    let number = "T-H-R-E-E"; // Don't change this line
    println!("Spell a number: {number}");

    // TODO: Fix the compiler error by changing the line below without renaming the variable.
    // ERTI called variable shadowing (eher selten)
    // Unterschied zu "mut"
    //  - Der Typ darf ändern (bei mut nicht)
    //  - Lifetime Nur einer can eine mut-variable verwenden
    let number = 3;
    println!("Number plus two is: {}", number + 2);
}
