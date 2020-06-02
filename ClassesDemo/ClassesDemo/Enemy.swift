//convention that class matches name of file
class Enemy {
    var health = 100
    var attackStrength = 10
    
    func move() {
        print("Walk forwards")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
