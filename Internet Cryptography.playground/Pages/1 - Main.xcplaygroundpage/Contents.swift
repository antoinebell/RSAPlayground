//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

//MARK : - RSA Keys
var RSA_P=0
var RSA_Q=0
var RSA_N=0
var RSA_M=0
var RSA_E=0
var RSA_D=0

//MARK: - Other variables used within the process
var r=2
var c=0
var gcd_answer=0

//MARK: - Exponent extension

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

//MARK: - Retrieve primes

func getPrimes() -> [Int] {
    var numbers = [Int](2..<150)
    for i in 0..<148 {
        let prime = numbers[i]
        guard prime > 0 else  { continue }
        for multiple in stride(from: 2*prime-2, to: 148, by: prime) {
            numbers[multiple] = 0
        }
    }
    
    return numbers.filter {$0 > 0}
}

//MARK: - Greatest common divisior

func gcd( a:Int, b:Int) -> Int {
    var b = b
    var a = a
    var t = 0
    while b != 0 {
        t = b
        b = a % b
        a = t
    }
    return a
}

//MARK: - Primes

var primes:[Int] = getPrimes()

//MARK: - LET'S START !

print("Let's start !")

print("You are now going to create your keys. In order to do this, you need to choose two prime numbers which we will call p and q.")

print("For this example, we'll pick a random prime 'p' within the first seven prime numbers.")
RSA_P = primes[Int(arc4random_uniform(UInt32(5)+1))]
print("Your prime is p =", RSA_P)

print("Again, we'll pick a random prime 'q' also within the first seven prime numbers.")
RSA_Q = primes[Int(arc4random_uniform(UInt32(5)+2))]
print("Your prime is q =", RSA_Q)

print("We have now our two prime numbers. We need to calculate 'n' which is very simple : n = p*q. Let's see what we get :")
RSA_N = RSA_P * RSA_Q
print("N which is the first part of our keys is :", RSA_N)

print("We now need to create m to prepare our other values. Again, m is very easy to find as m = (p-1) * (q-1).")
RSA_M = (RSA_P-1) * (RSA_Q-1)
print("M is equal to :", RSA_M)

print("Now, we need to determine e which is coprime to m. To do this, we need to find verify that 1 is the only common divisor. In this case, the value are coprime and this is what we want.")

while gcd_answer != 1 {
    var gcd_value = gcd(a: r, b: RSA_M)
    if gcd_value == 1 {
        gcd_answer = 1
        RSA_E = r
        break;
    } else {
        r=r+1
    }
}

print("We have now e, the second part of our public key which is :", RSA_E)
print("We just need now d and we can start encrypting and decrypting messages.")

print("d must follow this equation : d*e = 1 + c*m, it is equal to d = (1 + c*m)/e, but we need to determine c (an Integer) to then divide it by e like in the equation just before.")
while ((1 + c*RSA_M)%RSA_E) != 0 {
    c=c+1
}

print("We have now our value of c which is :", c)

RSA_D=((1 + c*RSA_M)/RSA_E)
print("Finished ! We have our last value d which is :", RSA_D)

print("We have now all our keys ! Let's summarize this :")

print("PUBLIC KEY : n=\(RSA_N) ; e=\(RSA_E)")
print("PRIVATE KEY : n=\(RSA_N) ; d=\(RSA_D)")


print("Let's switch to next page to encrypt and decrypt a small message.")


//: [Next](@next)
