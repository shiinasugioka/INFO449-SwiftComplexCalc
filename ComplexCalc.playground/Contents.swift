//: # UW Complex Calculator
//:
print("Welcome back to the UW Calculator")

//: ## Your tasks
//: The simple calculator you explored in the previous assignment was a smashing success with Upper Management, and they want more. Specifically, they want a version of it in a nicely self-contained class that they can import everywhere they need calculation capabilities throughout the enterprise. This is a mission-critical project!
//:
//: > PRO TIP: Not really.
//: 
//: Your job, then, is to create a Calculator class that performs the canonical operations of a calculator (add, subtract, multiply, etc) as well as a few other operations. 
//: 
//: In fact, knowing that Upper Management always has things going on that they don't tell you about, part of the goal is to make the calculator a little more flexible than the creators intended, and able to provide calculation using custom-built operations that the Calculator doesn't know about. In order to do that, the Calculator will be using "higher-order functions" to carry out its operations.
//: 
//: > PRO TIP: Don't always assume this when you get into the Real World (TM); sometimes they do, sometimes they don't, but adding a bunch of extensibility and additional features to code that isn't something the customer actually wants is known as "gold-plating" the code, and is just as much of a problem as not delivering what the customer actually wants.
//: 
//: Additionally, certain mathematical operations (add, multiply) support more than two parameters, which we should also support. These will take arrays of Integers as the single parameter.
//: 
//: On top of that, we should be able to perform some operations on some different data types, such as Cartesian points (x,y pairs), so our Calculator will need to support those as well. (Implementation note: by the use of the word "pairs" here, I mean to use tuples--specifically, `Int,Int` tuples. Two-element tuples are commonly called "pairs", three-element tuples are sometimes called "triplets", and four-element tuples are sometimes called "quads". If you get to a five-element tuple, you have a problem, just create a class or a struct and be done with it.)
//: 
//: And, because your instructor is an evil, evil man, we also want the Calculator to be able to add and subtract Cartesian points represented in `String-to-Int` dictionaries (maps), as well.
//: 
//: All of these will be backed by tests in the Playground code, so that you can know whether your code is working according to specification or not. You are free to look at the tests (they're right below the big comment line), but you may not modify them. If you want to add to them, that's acceptable, so long as you do it in the space provided.
//: 
//: > PRO TIP: It is strongly suggested that as you get each test working, commit your code to GitHub. Each time you get a little bit working, commit to GitHub. It is far, far easier for I and the TA to figure out where something went wrong and get you partial credit if we have a commit history to examine, as opposed to a "commit everything when I'm done" style that college students so often prefer. It's easier on your boss, too, when you get to a Real Job, if you have a rich commit history; on top of that, if you have something working, commit it, then make a change and the whole world seems to blow up, you can always revert back to that previous place of goodness and start over. Can't do that unless you commit regularly, though.
//:
//: Remember, don't change any of the pre-existing tests! *HOWEVER*, you are allowed to comment out some or all of the tests on a temporary basis in order to verify that the code is working--just remember to uncomment all of them before declaring the code finished.
//:
//: IMPORTANT: If any tests are commented out, you will be graded a zero (0)! You should never be in the habit of eliminating tests to make the code pass.
//:
class Calculator {
    
    func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func add(_ args: [Int]) -> Int {
        return args.reduce(0, +)
    }
    
    func add(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 + rhs.0, lhs.1 + rhs.1)
    }
    
    func add(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        var res: [String : Int] = [:]
        
        for (key, value) in lhs {
            res[key] = (res[key] ?? 0) + value
        }
        
        for (key, value) in rhs {
            res[key] = (res[key] ?? 0) + value
        }
        
        return res
    }
    
    func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func subtract(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 - rhs.0, lhs.1 - rhs.1)
    }
    
    func subtract(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        var res: [String : Int] = [:]
        
        for (key, value) in lhs {
            if let val = res[key] {
                res[key] = res[key]! - value
            } else {
                res[key] = value
            }
        }
        
        for (key, value) in rhs {
            if let val = res[key] {
                res[key] = res[key]! - value
            } else {
                res[key] = value
            }
        }
        
        return res
    }
    
    func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func multiply(_ args: [Int]) -> Int {
        if (args.count == 0) {
            return 0
        }
        
        return args.reduce(1, *)
    }
    
    func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    
    func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    func mathOp(args: [Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        return args.reduce(beg, op)
    }
    
    func count(_ args: [Int]) -> Int {
        return args.count
    }
    
    func avg(_ args: [Int]) -> Double {
        let count = args.count
        if (count == 0) {
            return 0
        }
        
        let sum = args.reduce(0, +)
        return Double(sum) / Double(count)
    }
    
}

//: Don't change the name of this object (`calc`); it's used in all the tests.
let calc = Calculator()

//: ## Extra credit
//: Add in your own tests here; they should not test something that is already covered by an existing test, but rest assured that I have not tested every boundary condition. Feel free to explore a variety of ideas, and do not be surprised if you come up with a possibility that isn't covered in my requirements! (I have been known to give extra credit if you find one!)
//:
//: We will give 0-2 pts depending on how pervasive and useful your new tests are.
//:
//: Suggestions for new tests: What about negative numbers? What about avg and an empty array? What about add or multiply with an empty array?
//:
//: Keep in mind that writing new tests may reveal ambiguity in the specification above--if that's the case, document the ambiguity, declare what you think *should* happen, and write the test to test for it.

// ===== Your tests go here

// Test 1: check empty array in add returns 0
calc.add([]) == 0

// Test 2: check empty array in avg returns 0
calc.avg([]) == 0

// Test 3: check empty array in multiply returns 0
calc.multiply([]) == 0

// Test 4: check add maps with different keys returns map with all keys
let map1 = ["x": -2, "y": 9]
let map2 = ["y": -2, "z": 4]
calc.add(lhs: map1, rhs: map2) == ["x": -2, "y": 7, "z": 4]

// Test 5: check avg returns double
calc.avg([2, 2, 3, 4, 5]) == 3.2
//: ---
//: ## Test code block
//: Do not modify the code in this section
calc.add(lhs: 2, rhs: 2) == 4
calc.subtract(lhs: 2, rhs: 2) == 0
calc.multiply(lhs: 2, rhs: 2) == 4
calc.divide(lhs: 2, rhs: 2) == 1

calc.mathOp(lhs: 5, rhs: 5, op: { (lhs: Int, rhs: Int) -> Int in (lhs + rhs) + (lhs * rhs) }) == 35
    // This style is one way of writing an anonymous function
calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20
    // This is the second, more terse, style; either works

calc.add([1, 2, 3, 4, 5]) == 15
calc.multiply([1, 2, 3, 4, 5]) == 120
calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8
calc.count([]) == 0
calc.avg([2, 2, 2, 2, 2, 2]) == 2
calc.avg([1, 2, 3, 4, 5]) == 3
calc.avg([1]) == 1

calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6
    // this is (((0 op 1) op 2) op 3)
calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15
    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1
    // this is (((((1 op 1) op 1) op 1) op 1) op 1)

let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
calc.add(lhs: p1, rhs: p2) == (17, -22)
calc.subtract(lhs: p1, rhs: p2) == (-7, 32)
calc.add(lhs: p4, rhs: p4) == (0, 0)
calc.add(lhs: p3, rhs: p4) == (-4, 4)

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]
calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9]
calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1]
